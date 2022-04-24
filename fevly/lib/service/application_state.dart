import 'dart:io';

import 'package:fevly/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Login state enum
enum ApplicationLoginState {
  loggedOut,
  loggedIn,
  emailAddress,
  password,
  register,
  verifyEmail,
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    _init();
  }

  // Members
  /// Login state
  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  /// ThemeMode state
  ThemeMode _themeModeState = ThemeMode.system;
  ThemeMode get themeModeState => _themeModeState;
  set themeModeState(ThemeMode newMode) {
    _themeModeState = newMode;
    notifyListeners();
  }

  String? _emailAddress;
  String? get emailAddress => _emailAddress;

  /// Get user login state and subscript to different collections in Firestore
  Future<void> _init() async {
    // Init
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Firebase auth
    FirebaseAuth.instance.userChanges().listen((user) async {
      if (user != null) {
        // User is connected
        if (!user.emailVerified) {
          _loginState = ApplicationLoginState.verifyEmail;
        } else
          _loginState = ApplicationLoginState.loggedIn;
      } else {
        // User is disconnected
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  /// Launch login flow
  /// Call when user click on connect with email
  void startLoginFlow() {
    print("Starting login flow");
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  /// Veryfing email address is already used
  /// and update loginstate.
  /// Call errorCallback if email address is not valid
  Future<bool> verifyEmailAddress({
    required String emailAddress,
    required void Function() functionBeforeRebuild,
    required int delayBeforeRebuild,
    //required void Function(FirebaseAuthException e) errorCallback,
  }) async {
    try {
      var is_already_used_by_google = false;
      var methodsOfConnexion =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
      if (methodsOfConnexion.isEmpty) {
        // Email address is not used
        _loginState = ApplicationLoginState.register;
      } else if (methodsOfConnexion.first == 'password') {
        // Email address is already used
        _loginState = ApplicationLoginState.password;
      } else if (methodsOfConnexion.first == 'google.com') {
        // Email address is already used by google account
        _loginState = ApplicationLoginState.loggedOut;
        is_already_used_by_google = true;
      }
      _emailAddress = emailAddress;
      functionBeforeRebuild();
      await Future.delayed(Duration(seconds: delayBeforeRebuild), () {
        notifyListeners();
      });
      return is_already_used_by_google;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  /// Reset email address
  Future<void> resetEmailAddress({required String email}) async {
    try {
      return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('Error while send password reset email: ' + e.message!);
      print(e);
    }
  }

  /// Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
    //required void Function(FirebaseAuthException e) errorCallback,
  }) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      //errorCallback(e);
      throw e;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  /// Cancel registration during login flow
  void cancelRegistration({
    required int delayBeforeRebuild,
  }) async {
    _loginState = ApplicationLoginState.loggedOut;
    await Future.delayed(Duration(seconds: delayBeforeRebuild), () {
      notifyListeners();
    });
  }

  /// Register new user
  Future<UserCredential> registerAccount({
    required String emailAddress,
    required String name,
    required String login, // TODO: add login support with firebase
    required String password,
  }) async {
    try {
      final user_credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((userCred) async {
        await userCred.user!.sendEmailVerification();
        return userCred;
      });

      await user_credential.user!.updateDisplayName(name);

      return user_credential;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  /// Sign out
  void signOut() {
    FirebaseAuth.instance.signOut();
    // Here listener in _init function will be call because of
    // an update of the user state.
  }
}

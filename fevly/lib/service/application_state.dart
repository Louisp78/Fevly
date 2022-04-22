import 'dart:io';

import 'package:fevly/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Login state enum
enum ApplicationLoginState {
  loggedOut,
  loggedIn,
  emailAddress,
  password,
  register
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
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        // User is connected
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
  Future<void> verifyEmailAddress({
    required String emailAddress,
    required void Function() functionBeforeRebuild,
    required int delayBeforeRebuild,
    //required void Function(FirebaseAuthException e) errorCallback,
  }) async {
    try {
      var methodsOfConnexion =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
      if (methodsOfConnexion.contains('password')) {
        // Email address is already used
        _loginState = ApplicationLoginState.password;
      } else {
        // Email address is not used
        _loginState = ApplicationLoginState.register;
      }
      _emailAddress = emailAddress;
      functionBeforeRebuild();
      await Future.delayed(Duration(seconds: delayBeforeRebuild), () {
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  /// Sign in with email and password
  Future<void> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
    //required void Function(FirebaseAuthException e) errorCallback,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      //errorCallback(e);
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
  Future<void> registerAccount({
    required String emailAddress,
    required String login, // TODO: add login support with firebase
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      //await credential.user!.updateDisplayName(name);

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

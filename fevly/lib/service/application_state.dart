import 'package:fevly/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  loading,
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    _init();
  }

  // Members
  ApplicationLoginState _loginState = ApplicationLoginState.loading;
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
        // User is connected but not verified
        if (!user.emailVerified) {
          _loginState = ApplicationLoginState.verifyEmail;
        } else {
          // User is connected and verified
          _loginState = ApplicationLoginState.loggedIn;
        }
      } else {
        // User is disconnected
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  /// Start login flow for email connexion
  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  /// Veryfing email address is already used
  /// and update loginstate.
  /// Call errorCallback if email address is not valid
  Future<void> verifyEmailAddress({
    required String emailAddress,
  }) async {
    try {
      final methodsOfConnexion =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
      _emailAddress = emailAddress;
      if (methodsOfConnexion.isEmpty) {
        // Email address is not used
        _loginState = ApplicationLoginState.register;
      } else if (methodsOfConnexion.first == 'password') {
        // Email address is already used
        _loginState = ApplicationLoginState.password;
      } else if (methodsOfConnexion.first == 'google.com') {
        // Email address is already used by google account
        _loginState = ApplicationLoginState.loggedOut;
      } else {
        throw FirebaseAuthException(
            code: 'unknown-error', message: 'Application state not handled');
      }
      notifyListeners();
    } on FirebaseAuthException {
      rethrow;
    }
  }

  /// Reset email address
  Future<void> resetEmailAddress({required String email}) async {
    try {
      return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('Error while send password reset email: ${e.message!}');
      print(e);
      rethrow;
    }
  }

  /// Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    // update context

    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // update context

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
      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        _loginState = ApplicationLoginState.loggedIn;
        return value;
      });
    } on Exception catch (_) {
      // TODO : handle error here with an unexpected PlatformException ?
      rethrow;
    }
  }

  /// Register new user
  Future<UserCredential> registerAccount({
    required String emailAddress,
    required String name,
    required String login, // TODO: add login support with firebase
    required String password,
  }) async {
    // Update context

    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((userCred) async {
        await userCred.user!.sendEmailVerification();
        return userCred;
      });

      await userCredential.user!.updateDisplayName(name);

      return userCredential;
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  /// Update password
  Future<void> updatePassword({
    required String newPassword,
  }) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.updatePassword(newPassword);
    }
    return Future.value();
  }

  /// TODO: Get a user's provider-specific profile information.

  /// Update display name
  Future<bool> updateDisplayName({required String newName}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.updateDisplayName(newName).then((value) => true);
    }
    return Future.value(false);
  }

  /// Update photo url
  Future<bool> updatePhotoUrl({required String newPhotoUrl}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.updatePhotoURL(newPhotoUrl).then((value) => true);
    }
    return Future.value(false);
  }

  /// Update email address
  Future<bool> updateEmailAddress({required String newEmailAddress}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.updateEmail(newEmailAddress).then((value) => true);
    }
    return Future.value(false);
  }

  Future<bool> deleteUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.delete().then((value) => true);
    }
    return Future.value(false);
  }

  /// Sign out
  Future<void> signOut({required BuildContext context}) {
    return FirebaseAuth.instance.signOut();
    // Here listener in _init function will be call because of
    // an update of the user state.
  }
}

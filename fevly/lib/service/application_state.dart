import 'package:fevly/components/snackbar/basic_snackbar.dart';
import 'package:fevly/firebase_options.dart';
import 'package:fevly/model/user_infos.dart';
import 'package:fevly/service/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recase/recase.dart';

/// Login state enum :
/// Describe the current login state of the user
enum ApplicationLoginState {
  loggedOut,
  loggedIn,
  emailAddress,
  password,
  register,
  verifyEmail,
  loading,
}

/// Auth provider :
/// All available auth providers
enum AuthProvider {
  google,
  emailPassword,
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    _init();
  }

  // Members
  ApplicationLoginState _loginState = ApplicationLoginState.loading;

  /// Current login state of the user
  ApplicationLoginState get loginState => _loginState;

  /// member only use to send notification to the user that email is verified
  /// in [_init] method inside user listener
  BuildContext? _prevContext;

  /// Last instance from the user listener
  User? userLastInstance;

  /// Last instance from the pseudo listener
  UserInfos? userInfos;

  late AuthProvider _authProvider;

  /// Current auth provider
  AuthProvider get authProvider => _authProvider;

  /// ThemeMode state
  ThemeMode _themeModeState = ThemeMode.system;
  ThemeMode get themeModeState => _themeModeState;
  set themeModeState(ThemeMode newMode) {
    _themeModeState = newMode;
    notifyListeners();
  }

  String? _emailAddress;

  /// Email address of current user
  String? get emailAddress => _emailAddress;

  /// _init() :
  /// - Init Firebase
  /// - Listen for user login state changes and update [_loginState] member
  /// - When user is logged in, listen for pseudo changes and update
  /// - Setting the [_authProvider] member if logged in
  Future<void> _init() async {
    // Init
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Firebase auth
    FirebaseAuth.instance.userChanges().listen((user) async {
      //print('User listener called : $user');
      userLastInstance = user;
      if (user != null) {
        //print('Current user id : ${user.uid}');
        pseudoListener(user: user);
        // User is connected but not verified
        if (!user.emailVerified) {
          _loginState = ApplicationLoginState.verifyEmail;
        } else {
          // User is connected and verified
          if (_loginState == ApplicationLoginState.verifyEmail) {
            buildBasicSnackbar(
                context: _prevContext!, message: 'Votre email est vérifié 🎉');
          }
          _loginState = ApplicationLoginState.loggedIn;
          setAuthProvider();
        }
      } else {
        // User is disconnected
        _loginState = ApplicationLoginState.loggedOut;
        userInfos = null;
      }
      notifyListeners();
    });
  }

  /// Start login flow for email connexion
  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  /// Listener of pseudo changes in Cloud Firestore
  Future<void> pseudoListener({required User user}) async {
    final docRef = await db.collection("users").doc(user.uid);

    docRef.snapshots().listen(
      (res) async {
        try {
          userInfos = UserInfos(
            pseudo: await res.get('pseudo') as String,
            user: user,
          );
        } on StateError catch (e) {
          if (user.displayName != null) {
            // If pseudo is not inside the db use displayName in snake case instead
            final rc = ReCase(user.displayName!);
            await addUserToFS(userId: user.uid, pseudo: rc.snakeCase);
            userInfos = UserInfos(
              pseudo: rc.snakeCase,
              user: user,
            );
          } else {
            // If displayName is null, set pseudo to 'Anonyme'
            userInfos = UserInfos(
              pseudo: 'Anonyme',
              user: user,
            );
          }
        }
        notifyListeners();
      },
      onError: (e) => print("Error completing: $e"), // FIXME : Handle error
    );
  }

  /// Veryfing email address is already used
  /// and update [_loginState] member
  /// Call errorCallback if email address is not valid
  Future<void> verifyEmailAddress({
    required String emailAddress,
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onInvalidEmail,
    void Function()? onSuccess,
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
      onSuccess?.call();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else if (e.code == 'invalid-email') {
        onInvalidEmail();
      } else {
        print('Not handle exception $e');
        rethrow;
      }
    }

    notifyListeners();
  }

  /// Send email verification
  Future<void> sendEmailVerification({
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    void Function()? onSuccess,
  }) async {
    try {
      return await FirebaseAuth.instance.currentUser!
          .sendEmailVerification()
          .then((_) => onSuccess?.call());
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else {
        print('Not handle exception $e');
        rethrow;
      }
    }
  }

  /// Safe reload user with error handling
  /// This method will trigger the user listener in [_init] method
  /// Only use this method when necessary (likely after a email verification)
  Future<void> reloadUser({
    required BuildContext context,
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
  }) async {
    try {
      _prevContext = context;
      await FirebaseAuth.instance.currentUser!.reload();
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else {
        print('Not handle exception $e');
        rethrow;
      }
    }
  }

  /// Determine what is the provider used by the user for authentication (see [AuthProvider] enum)
  /// Set [_authProvider] member from fetchingSignInMethodsForEmail method
  Future<void> setAuthProvider() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    try {
      final methodsOfConnexion =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(user.email!);
      _emailAddress = emailAddress;
      if (methodsOfConnexion.isEmpty) {
        // Email address is not used
        /*throw FirebaseAuthException(
            code: 'unknown-email', message: 'Email address not used');*/
      } else if (methodsOfConnexion.first == 'password') {
        // Email address is already used
        _authProvider = AuthProvider.emailPassword;
      } else if (methodsOfConnexion.first == 'google.com') {
        // Email address is already used by google account
        _authProvider = AuthProvider.google;
      } else {
        throw FirebaseAuthException(
            code: 'unknown-error', message: 'Application state not handled');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        _loginState = ApplicationLoginState.loading;
      }
      if (e.code == 'too-many-requests') {
        _loginState = ApplicationLoginState.loading;
      } else if (e.code == 'operation-not-allowed') {
        _loginState = ApplicationLoginState.loading;
      } else {
        print('Not handle exception $e');
        rethrow;
      }
    }
  }

  /// Send a link to reset password on [email] specified
  Future<void> sendPasswordReset({
    required String email,

    /// Exceptions
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    void Function()? onSuccess,
  }) async {
    try {
      return await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) => onSuccess?.call());
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else {
        print('Not handle exception $e');
        rethrow;
      }
    }
  }

  /// Sign in with email and password
  /// This method will trigger the user listener in [_init] method
  Future<void> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    required void Function() onNetworkRequestFailed,
    required void Function() onWrongPassword,
    void Function()? onSuccess,
  }) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        _authProvider = AuthProvider.emailPassword;
        if (onSuccess != null) {
          onSuccess();
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else if (e.code == 'wrong-password') {
        onWrongPassword();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }

  /// Sign in with google
  /// This method will trigger the user listener in [_init] method
  Future<void> signInWithGoogle({
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    required void Function() onSuccess,
  }) async {
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
        _authProvider = AuthProvider.google;
      }).then((_) => onSuccess());
    } on FirebaseException catch (e) {
      // TODO : handle error here with an unexpected PlatformException ?
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    } on PlatformException catch (e) {
      if (e.code == 'network_error') {
        onNetworkRequestFailed();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }

  /// Register new user from email and password
  /// sendEmailVerification is called after signInWithEmailAndPassword automatically
  /// and provider is set to [AuthProvider.emailPassword].
  /// displayName is update and
  /// [pseudo] is written in Cloud Firestore
  /// This method will trigger the user listener in [_init] method
  Future<void> registerAccount({
    required String emailAddress,
    required String name,
    required String pseudo, // TODO: add login support with firebase
    required String password,

    /// Exceptions
    required void Function() onOperationNotAllowed,
    required void Function() onTooManyRequests,
    required void Function() onNetworkRequestFailed,
    required void Function() onWeakPassword,
    required void Function() onSuccess,
  }) async {
    try {
      /// Register new user
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((userCred) async {
        await userCred.user!.sendEmailVerification();
        _authProvider = AuthProvider.emailPassword;
        return userCred;
      });

      /// Update display name
      await userCredential.user!.updateDisplayName(name);

      /// Update pseudo
      await addUserToFS(userId: userCredential.user!.uid, pseudo: pseudo)
          .then((_) => onSuccess());
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else if (e.code == 'weak-password') {
        onWeakPassword();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }

  /// Update password with [newPassword].
  /// [onRequiresRecentLogin] is called to ask user to login again.
  Future<void> updatePassword({
    required String newPassword,

    /// Exceptions
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    required void Function() onRequiresRecentLogin,
    required void Function() onSuccess,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        return await user.updatePassword(newPassword).then((value) {
          onSuccess();
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        onRequiresRecentLogin();
      } else if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }

  /// Update display name
  Future<bool> updateDisplayName({
    required String newName,

    /// Exceptions
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    required void Function() onSuccess,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return await user.updateDisplayName(newName).then((value) {
          onSuccess();
          return true;
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
    return Future.value(false);
  }

  /// Update photo url of the current user.
  /// This method is likely called after the photo has been uploaded to Firebase Storage,
  /// thanks to [FireStorage.uploadProfilePhoto(userId, file)]
  Future<void> updatePhotoUrl({
    required String newPhotoUrl,

    /// Exceptions
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    void Function()? onSuccess,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return await user
            .updatePhotoURL(newPhotoUrl)
            .then((value) => onSuccess?.call());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }

  /// Update email address
  Future<void> updateEmailAddress({
    required String newEmailAddress,

    /// Exceptions
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    required void Function() onRequiresRecentLogin,
    required void Function() onEmailAlreadyInUse,
    required void Function() onSuccess,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return await user.updateEmail(newEmailAddress).then((value) {
          onSuccess();
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        onEmailAlreadyInUse();
      } else if (e.code == 'requires-recent-login') {
        onRequiresRecentLogin();
      } else if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }

  /// Update pseudo from Cloud Firestore
  Future<void> updatePseudo({
    required String userId,
    required String newPseudo,

    /// Exceptions
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    required void Function() onSuccess,
  }) async {
    try {
      return await addUserToFS(userId: userId, pseudo: newPseudo)
          .then((value) => onSuccess());
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }

  /// Delete current logged user
  /// This method will trigger the user listener in [_init] method
  Future<void> deleteUser({
    /// Exceptions
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    required void Function() onRequiresRecentLogin,
    void Function()? onSucess,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return await user.delete().then((value) => onSucess?.call());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        onRequiresRecentLogin();
      } else if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }

  /// Reauthenticate user
  /// This method is likely called after a [onRequiresRecentLogin] exception from [updatePassword] for example.
  /// What is happening depend on the [_authProvider] member :
  /// - if [_authProvider] is [AuthProvider.Google] : the user is logged out and immediately logged in again
  /// - if [_authProvider] is [AuthProvider.EmailAndPassword] : the method [reauthenticateWithEmailAndPassword] is called
  /// This method will trigger the user listener in [_init] method
  Future<void> reauthenticateUser({
    required String emailAddress,
    required String password,

    /// Exceptions
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    required void Function() onWrongPassword,
    void Function()? onSuccess,
  }) async {
    try {
      if (_authProvider == AuthProvider.emailPassword) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return await user
              .reauthenticateWithCredential(EmailAuthProvider.credential(
                email: user.email!,
                password: password,
              ))
              .then((value) => onSuccess?.call());
        }
      } else if (_authProvider == AuthProvider.google) {
        await FirebaseAuth.instance.signOut();
        await signInWithGoogle(
            onNetworkRequestFailed: onNetworkRequestFailed,
            onOperationNotAllowed: onOperationNotAllowed,
            onTooManyRequests: onTooManyRequests,
            onSuccess: onSuccess ?? (() {}));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else if (e.code == 'wrong-password') {
        onWrongPassword();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }

  /// Sign out the current user
  /// This method will trigger the user listener in [_init] method
  Future<void> signOut({
    required void Function() onNetworkRequestFailed,
    required void Function() onTooManyRequests,
    required void Function() onOperationNotAllowed,
    void Function()? onSuccess,
  }) async {
    try {
      return FirebaseAuth.instance.signOut().then((_) => onSuccess?.call());
    } on FirebaseException catch (e) {
      if (e.code == 'network-request-failed') {
        onNetworkRequestFailed();
      } else if (e.code == 'operation-not-allowed') {
        onOperationNotAllowed();
      } else if (e.code == 'too-many-requests') {
        onTooManyRequests();
      } else {
        print('Not handled error: $e');
        rethrow;
      }
    }
  }
}

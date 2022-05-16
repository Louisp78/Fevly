import 'package:fevly/components/dialog/disconnect.dart';
import 'package:fevly/components/dialog/leave.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/auth/anim/martini_anim.dart';
import 'package:fevly/screens/auth/email_screen.dart';
import 'package:fevly/screens/auth/logged_out_screen.dart';
import 'package:fevly/screens/auth/register_screen.dart';
import 'package:fevly/screens/auth/sign_in_screen.dart';
import 'package:fevly/screens/auth/verify_email_screen.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/screens/condition_of_use/condition_of_use_screen.dart';
import 'package:fevly/screens/dashboard/dashboard_screen.dart';
import 'package:fevly/screens/loading/loading_screen.dart';
import 'package:fevly/screens/modify_password/modify_password_screen.dart';
import 'package:fevly/screens/modify_profile/modify_profile_screen.dart';
import 'package:fevly/screens/modify_profile/view_model/modify_profile_view_model.dart';
import 'package:fevly/screens/notifications/notifications_screen.dart';
import 'package:fevly/screens/party/party_screen.dart';
import 'package:fevly/screens/party_info/party_info_screen.dart';
import 'package:fevly/screens/profile/profile_screen.dart';
import 'package:fevly/screens/reauthenticate/reauthenticate_screen.dart';
import 'package:fevly/screens/settings/settings_screen.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fevly/models/party.dart';

mixin RouterNav {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// This route is the root and auto build right screen depending on [ApplicationState.loginState]
      /// Following screens can be build :
      /// - [LoadingScreen]
      /// - [LoggedOutScreen]
      /// - [VerifyEmailScreen]
      /// - [DashboardScreen]
      case '/':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return Consumer<ApplicationState>(
              builder: (context, appState, child) {
            if (appState.loginState == ApplicationLoginState.loggedIn) {
              return WillPopScope(
                onWillPop: () async {
                  buildLeaveAppDialog(context: context);
                  return false;
                },
                child: const DashboardScreen(),
              );
            } else if (appState.loginState == ApplicationLoginState.loading) {
              return WillPopScope(
                onWillPop: () => Future.value(false),
                child: const LoadingScreen(),
              );
            } else if (appState.loginState ==
                ApplicationLoginState.verifyEmail) {
              return ChangeNotifierProvider(
                create: (context) => AuthViewModel(),
                child: WillPopScope(
                  onWillPop: () {
                    buildDisconnectDialog(context: context);
                    return Future.value(false);
                  },
                  child: const VerifyEmailScreen(),
                ),
              );
            } else {
              return ChangeNotifierProvider(
                create: (context) => AuthViewModel(),
                child: WillPopScope(
                    onWillPop: () {
                      buildLeaveAppDialog(context: context);
                      return Future.value(false);
                    },
                    child: const LoggedOutScreen()),
              );
            }
          });
        });

      /// This route is call from [RegisterScreen]
      case '/verify_email':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangeNotifierProvider<AuthViewModel>(
              create: (context) => AuthViewModel(),
              child: const VerifyEmailScreen(),
            );
          },
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/email':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangeNotifierProvider<AuthViewModel>(
              create: (context) => AuthViewModel(),
              child: const EmailScreen(),
            );
          },
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/email/sign_in':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangeNotifierProvider<AuthViewModel>(
                create: (context) => AuthViewModel(),
                child: const SignInScreen());
          },
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/email/register':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangeNotifierProvider<AuthViewModel>(
                create: (context) => AuthViewModel(),
                child: const RegisterScreen());
          },
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/terms_of_use':
        return MaterialPageRoute(builder: (_) => const TermOfUseScreen());
      case '/reauthenticate':
        return MaterialPageRoute(builder: (_) {
          final args = settings.arguments! as Map<String, dynamic>;
          return ReauthenticateScreen(
            type: args['type'] as ReauthenticationType,
            strValue: args['valueStr'] as String,
          );
        });

      case '/profile':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProfileScreen(profileOwner: settings.arguments! as User),
          transitionsBuilder: slideUpTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/profile/modify':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              Consumer<ApplicationState>(builder: (context, appState, _) {
            return ChangeNotifierProvider(
                create: (context) => ModifyProfileViewModel(),
                child: const ModifyProfileScreen());
          }),
          transitionsBuilder: slideUpTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/profile/modify/password':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ModifyPasswordScreen(),
        );
      case '/dashboard':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DashboardScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: slideLeftTransition(),
        );

      case '/party/party_info':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              PartyInfoScreen(
            party: settings.arguments! as Party,
          ),
        );
      case '/party':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => PartyScreen(
            party: settings.arguments! as Party,
          ),
        );
      case '/notifications':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const NotificationsScreen(),
        );
      case '/settings':
        return PageRouteBuilder(
            transitionsBuilder: slideLeftTransition(),
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SettingsScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

import 'package:fevly/screens/auth/email_screen.dart';
import 'package:fevly/screens/auth/logged_out_screen.dart';
import 'package:fevly/screens/auth/register_screen.dart';
import 'package:fevly/screens/auth/sign_in_screen.dart';
import 'package:fevly/screens/auth/verify_email_screen.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/screens/condition_of_use/condition_of_use_screen.dart';
import 'package:fevly/screens/dashboard/dashboard_screen.dart';
import 'package:fevly/screens/loading/loading_screen.dart';
import 'package:fevly/screens/notifications/notifications_screen.dart';
import 'package:fevly/screens/party/party_screen.dart';
import 'package:fevly/screens/party_info/party_info_screen.dart';
import 'package:fevly/screens/settings/settings_screen.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fevly/models/party.dart';

mixin RouterNav {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return Consumer<ApplicationState>(
              builder: (context, appState, child) {
            if (appState.loginState == ApplicationLoginState.loggedIn) {
              return const DashboardScreen();
            } else if (appState.loginState == ApplicationLoginState.loading) {
              return const LoadingScreen();
            } else {
              return ChangeNotifierProvider(
                  create: (context) => AuthViewModel(),
                  child: const LoggedOutScreen());
            }
          });
        });
      /*case '/auth/logged_out':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangeNotifierProvider<AuthViewModel>(
                create: (context) => AuthViewModel(),
                child: const LoggedOutScreen());
          },
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );*/

      case '/auth/logged_out/verify_email':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangeNotifierProvider<AuthViewModel>(
                create: (context) => AuthViewModel(),
                child: const VerifyEmailScreen());
          },
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/auth/logged_out/email':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangeNotifierProvider<AuthViewModel>(
                create: (context) => AuthViewModel(),
                child: const EmailScreen());
          },
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/auth/logged_out/sign_in':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangeNotifierProvider<AuthViewModel>(
                create: (context) => AuthViewModel(),
                child: const SignInScreen());
          },
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/auth/logged_out/register':
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

      /*case '/profile':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProfileScreen(profileOwner: settings.arguments! as User),
          transitionsBuilder: slideUpTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );*/

      /*case '/search':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            final Map args = settings.arguments! as Map;
            return SearchScreen(
              mainList: args['mainList'] as List<User>,
              suggestionList1Name: args['suggestionList1Name'] as String,
              suggestionList2Name: args['suggestionList2Name'] as String?,
              userSuggestionList1: args['userSuggestionList1'] as List<User>,
              userSuggestionList2: args['userSuggestionList2'] as List<User>?,
              type: args['type'] as SearchScreenType,
            );
          },
          transitionsBuilder: slideLeftTransition(),
        );
*/
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

      /*
      ! Not for minimal version
      case '/profile/my_lists':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              MyListsScreen(
            listOfGuestList: kCurrentUser.listOfGuestList,
            listOfProductList: kCurrentUser.listOfProductList,
          ),
        );

      case '/profile/my_lists/product_list':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProductListScreen(
            productList: settings.arguments! as ProductList,
          ),
        );

      case '/profile/my_lists/guest_list':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProductListScreen(
            productList: settings.arguments! as ProductList,
          ),
        );*/
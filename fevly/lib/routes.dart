import 'package:fevly/components/custom_snackbar.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/auth/auth_screen.dart';
import 'package:fevly/screens/condition_of_use/condition_of_use_screen.dart';
import 'package:fevly/screens/dashboard/dashboard_screen.dart';
import 'package:fevly/screens/notifications/notifications_screen.dart';
import 'package:fevly/screens/party/party_screen.dart';
import 'package:fevly/screens/party_info/party_info_screen.dart';
import 'package:fevly/screens/profile/profile_screen.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/screens/settings/settings_screen.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/party.dart';

mixin RouterNav {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      // FIXME : find a better way to rebuild and keep the good route
      case '/':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              Consumer<ApplicationState>(builder: (context, appState, _) {
            final ApplicationState appState =
                Provider.of<ApplicationState>(context);
            if (appState.loginState == ApplicationLoginState.loggedIn) {
              //return Navigator.pushNamed(context, '/dashboard');
              return const DashboardScreen();
            } else {
              return const AuthScreen();
              //Navigator.pushNamed(context, '/auth');
            }
          }),
          transitionsBuilder: slideUpTransition(),
          transitionDuration: const Duration(milliseconds: 1000),
        );

      case '/auth':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AuthScreen(),
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/terms_of_use':
        return MaterialPageRoute(builder: (_) => const TermOfUseScreen());

      case '/profile':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProfileScreen(profileOwner: settings.arguments! as User),
          transitionsBuilder: slideUpTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );

      case '/search':
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

      case '/dashboard':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DashboardScreen(),
          transitionDuration: const Duration(milliseconds: 500),
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
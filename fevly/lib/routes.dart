import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/condition_of_use/condition_of_use_screen.dart';
import 'package:fevly/screens/dashboard/dashboard_screen.dart';
import 'package:fevly/screens/login/login_screen.dart';
import 'package:fevly/screens/notifications/notifications_screen.dart';
import 'package:fevly/screens/party/party_screen.dart';
import 'package:fevly/screens/party_info/party_info_screen.dart';
import 'package:fevly/screens/profile/profile_screen.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/screens/signin/signin_step1/signin_step1_screen.dart';
import 'package:fevly/screens/signin/signin_step2/signin_step2_screen.dart';
import 'package:fevly/styles/transition.dart';
import 'package:flutter/material.dart';

import 'models/party.dart';


mixin RouterNav {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/signin_step1':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignInStep1Screen(),
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );

      case '/signin_step1/signin_step2':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            final Map args = settings.arguments! as Map;
            return SignInStep2Screen(
              email: args['email'] as String,
              password: args['password'] as String,
            );
          },
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/signin_step1/signin_step2/term_of_use':
        return MaterialPageRoute(builder: (_) => const TermOfUseScreen());

      case '/profile':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProfileScreen(profileOwner: settings.arguments! as User),
          transitionsBuilder: slideUpTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );

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
        );

      case '/dashboard':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DashboardScreen(),
          transitionsBuilder: slideUpTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );

      case '/party/party_info':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              PartyInfoScreen(party: settings.arguments! as Party,),
        );
      case '/party':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              PartyScreen(party: settings.arguments! as Party,),
        );
      case '/notifications':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const NotificationsScreen(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

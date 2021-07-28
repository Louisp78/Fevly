import 'package:fevly/screens/condition_of_use/condition_of_use_screen.dart';
import 'package:fevly/screens/login/login_screen.dart';
import 'package:fevly/screens/my_lists/my_lists_screen.dart';
import 'package:fevly/screens/profile/profile_screen.dart';
import 'package:fevly/screens/signin/signin_step1/signin_step1_screen.dart';
import 'package:fevly/screens/signin/signin_step2/signin_step2_screen.dart';
import 'package:fevly/styles/transition.dart';
import 'package:flutter/material.dart';

class RouterNav {
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

      case '/signin_step2':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignInStep2Screen(),
          transitionsBuilder: slideLeftTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );
      case '/signin_step2/term_of_use':
        return MaterialPageRoute(builder: (_) => const TermOfUseScreen());

      case '/profile':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ProfileScreen(),
          transitionsBuilder: slideUpTransition(),
          transitionDuration: const Duration(milliseconds: 500),
        );

      case '/profile/my_lists':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyListsScreen(),
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


// Exemple de code pour le routage :
// case '/organization/create':
//   return MaterialPageRoute(
//       builder: (_) => OrganizationCreate(
//             userUid: settings.arguments,
//           ));
// case '/organization/guests':
//   return MaterialPageRoute(builder: (_) {
//     final Map arguments = settings.arguments as Map;
//     Party party = arguments['party'];
//     bool userIsAdmin = arguments['userIsAdmin'];
//     return MultiProvider(
//         providers: [
//           StreamProvider<List<Guest>>.value(
//             value: DatabaseService(partyUid: party.uid).partyGuestUid,
//           ),
//         ],
//         child: GuestsScreen(
//           party: party,
//           userIsAdmin: userIsAdmin,
//         ));
//   });
// case '/organization/shopping':
//   return MaterialPageRoute(
//       builder: (_) => StreamProvider<List<Product>>.value(
//             value: DatabaseService(partyUid: settings.arguments).products,
//             child: ShoppingScreen(
//               partyUid: settings.arguments,
//             ),
//           ));
// case '/organization/notification':
//   return MaterialPageRoute(builder: (_) => NotificationScreen());

// case '/parties':
//   return MaterialPageRoute(builder: (_) {
//     return MultiProvider(
//       providers: [
//         StreamProvider<List<Party>>.value(
//             value: DatabaseService(userUid: settings.arguments)
//                 .invitedParties),
//         StreamProvider<List<OrganizedParty>>.value(
//             value: DatabaseService(userUid: settings.arguments)
//                 .organizedParties),
//       ],
//       child: PartiesScreen(
//         userUid: settings.arguments,
//       ),
//     );
//   });

// case '/map':
//   return MaterialPageRoute(
//       builder: (_) => MultiProvider(
//               providers: [
//                 StreamProvider<List<Party>>.value(
//                     value: DatabaseService(userUid: settings.arguments)
//                         .invitedParties),
//                 StreamProvider<List<OrganizedParty>>.value(
//                     value: DatabaseService(userUid: settings.arguments)
//                         .organizedParties),
//               ],
//               child: MapScreen(
//                 userUid: settings.arguments,
//               )));
// case '/profile':
//   return MaterialPageRoute(
//       builder: (_) => ProfileScreen(
//             userData: settings.arguments,
//           ));
// case '/profile/modify':
//   return MaterialPageRoute(builder: (_) {
//     final Map arguments = settings.arguments as Map;
//     UserData userData = arguments['userData'];
//     UserInfos userInfos = arguments['userInfos'];
//     return ModifyProfileScreen(
//       userData: userData,
//       userInfos: userInfos,
//     );
//   });
// case '/search':
//   return MaterialPageRoute(
//       builder: (_) => SearchScreen(
//             userUid: settings.arguments,
//           ));
// case '/loading':
//   return MaterialPageRoute(builder: (_) => Loading());
// case '/test':
//   return MaterialPageRoute(builder: (_) => TestMaterialScreen());
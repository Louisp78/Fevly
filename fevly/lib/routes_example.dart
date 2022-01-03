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

import 'dart:async';

import 'package:fevly/routes.dart';
import 'package:fevly/screens/search_address/search_address_screen.dart';
import 'package:fevly/screens/search_address/view_model/search_address_model_view.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) {
        return const Fevly();
      },
    ),
  );
}

class Fevly extends StatelessWidget {
  // This widget is the root of your application.

  const Fevly();

  @override
  Widget build(BuildContext context) {
    // init date format
    initializeDateFormatting('fr');
    final ApplicationState appState = Provider.of<ApplicationState>(context);

    return MaterialApp(
      title: 'Fevly',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: appState.themeModeState,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouterNav.generateRoute,
    );
  }
}

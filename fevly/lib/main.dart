import 'dart:io';
import 'package:fevly/models/dynamic_theme_mode.dart';
import 'package:fevly/routes.dart';
import 'package:fevly/screens/login/login_screen.dart';
import 'package:fevly/styles/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<DynamicThemeMode>(
    create: (_) => DynamicThemeMode(),
    child: Fevly(initialRoute: '/login',),
    ));
}

class Fevly extends StatelessWidget {
  // This widget is the root of your application.
  final String initialRoute;
  
  Fevly({required this.initialRoute,
  }) 
  : assert(initialRoute.contains("/"));

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<DynamicThemeMode>(context);
    final String deviceLanguage = Platform.localeName.substring(0, 2);
    GestureBinding.instance?.resamplingEnabled = true; // Set this flag.
    initializeDateFormatting(
      deviceLanguage,
    );
    return MaterialApp(
      title: 'Fevly',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: themeMode.mode,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      initialRoute: initialRoute,
      onGenerateRoute: RouterNav.generateRoute,
    );
  }
}

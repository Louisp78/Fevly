import 'dart:io';
import 'package:fevly/routes.dart';
import 'package:fevly/screens/login/login_screen.dart';
import 'package:fevly/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final String deviceLanguage = Platform.localeName.substring(0, 2);
    initializeDateFormatting(
      deviceLanguage,
    );
    return MaterialApp(
      title: 'Fevly',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      initialRoute: '/login',
      onGenerateRoute: RouterNav.generateRoute,
    );
  }
}

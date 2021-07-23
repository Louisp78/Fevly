import 'package:fevly/routes.dart';
import 'package:fevly/screens/login/login_screen.dart';
import 'package:fevly/styles/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fevly',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      initialRoute: '/profile',
      onGenerateRoute: RouterNav.generateRoute,
    );
  }
}

import 'package:fevly/routes.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
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

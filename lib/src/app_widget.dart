import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/app/app_routes.dart';
import 'package:life_goals_pdm/src/app/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme,
      routes: routes,
    );
  }
}

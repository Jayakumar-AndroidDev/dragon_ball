import 'package:dragon_ball_app/core/app_route/app_route.dart';
import 'package:dragon_ball_app/core/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: AppRoute.onboardPage,
    );
  }
}
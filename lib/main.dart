import 'package:dragon_ball_app/core/app_route/app_route.dart';
import 'package:dragon_ball_app/core/app_theme/app_theme.dart';
import 'package:dragon_ball_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: AppRoute.splashPage,
    );
  }
}
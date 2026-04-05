// lib/app.dart

import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_notifier.dart';

class MovieCatalogApp extends StatefulWidget {
  const MovieCatalogApp({super.key});

  @override
  State<MovieCatalogApp> createState() => _MovieCatalogAppState();
}

class _MovieCatalogAppState extends State<MovieCatalogApp> {
  // Default dark agar nuansa bioskop terasa dari awal
  final ThemeNotifier _themeNotifier = ThemeNotifier(initial: ThemeMode.dark);

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      notifier: _themeNotifier,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: _themeNotifier,
        builder: (context, themeMode, child) {
          return MaterialApp.router(
            title: 'Movie Catalog',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
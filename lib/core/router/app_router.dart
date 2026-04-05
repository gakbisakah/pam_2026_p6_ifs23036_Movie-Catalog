// lib/core/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/home_screen.dart';
import '../../features/movies/movies_screen.dart';
import '../../features/movies/movie_detail_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../core/constant/route_constants.dart';
import '../../shared/widget/bottom_nav_widget.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConstants.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainShell(child: child);
      },
      routes: [
        GoRoute(
          path: RouteConstants.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: RouteConstants.movies,
          builder: (context, state) => const MoviesScreen(),
        ),
        GoRoute(
          path: RouteConstants.movieDetail,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? '';
            return MovieDetailScreen(movieId: movieId);
          },
        ),
        GoRoute(
          path: RouteConstants.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavWidget(child: child),
    );
  }
}
// lib/features/home/home_screen.dart

import 'package:flutter/material.dart';
import '../../shared/widget/top_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopAppBarWidget(title: 'Movie Catalog'),
      body: _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 24),
      child: Column(
        children: [
          Card(
            elevation: 6,
            color: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    '🎬 Selamat Datang di Movie Catalog 🍿',
                    style:
                    Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Temukan film favorit Anda, dari blockbuster terbaru hingga mahakarya klasik.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ['🎥', '🎭', '🎞️', '⭐'].map((emoji) {
              return Card(
                margin: const EdgeInsets.all(8),
                elevation: 4,
                color: colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    emoji,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const _HomeInfoCard(
            icon: Icons.movie,
            title: 'Koleksi Film Terlengkap',
            subtitle:
            'Jelajahi berbagai genre film mulai dari Action, Drama, hingga Sci-Fi.',
          ),
          const SizedBox(height: 8),
          const _HomeInfoCard(
            icon: Icons.trending_up,
            title: 'Trending Sekarang',
            subtitle:
            'Lihat apa yang sedang populer dan banyak ditonton minggu ini.',
          ),
          const SizedBox(height: 8),
          const _HomeInfoCard(
            icon: Icons.star_rate,
            title: 'Rating & Review',
            subtitle:
            'Baca ulasan dari para penonton dan beri rating pada film favoritmu.',
          ),
        ],
      ),
    );
  }
}

class _HomeInfoCard extends StatelessWidget {
  const _HomeInfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 3,
      color: colorScheme.surface,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: colorScheme.primary, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style:
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
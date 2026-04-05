// lib/features/planets/planets_detail_screen.dart

import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../data/models/planet_model.dart';
import '../../shared/widget/loading_widget.dart';
import '../../shared/widget/top_app_bar_widget.dart';

class PlanetsDetailScreen extends StatefulWidget {
  const PlanetsDetailScreen({super.key, required this.planetName});

  final String planetName;

  @override
  State<PlanetsDetailScreen> createState() => _PlanetsDetailScreenState();
}

class _PlanetsDetailScreenState extends State<PlanetsDetailScreen> {
  PlanetModel? _planet;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final result = DummyData.getPlanetsData()
          .where((p) => p.nama == widget.planetName)
          .firstOrNull;
      if (mounted) {
        setState(() => _planet = result);
        if (result == null && mounted) {
          Navigator.of(context).pop();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_planet == null) {
      return Scaffold(
        appBar: TopAppBarWidget(
          title: widget.planetName,
          showBackButton: true,
        ),
        body: const LoadingWidget(),
      );
    }

    return Scaffold(
      appBar: TopAppBarWidget(
        title: _planet!.nama,
        showBackButton: true,
      ),
      body: _PlanetsDetailBody(planet: _planet!),
    );
  }
}

class _PlanetsDetailBody extends StatelessWidget {
  const _PlanetsDetailBody({required this.planet});

  final PlanetModel planet;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Image.asset(
                  planet.gambar,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.public,
                      size: 100,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  planet.nama,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  '📍 ${planet.jarakDariMatahari}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          _InfoCard(title: '🌌 Deskripsi', content: planet.deskripsi),
          const SizedBox(height: 16),
          _InfoCard(
              title: '✨ Fakta Menarik', content: planet.faktaMenarik),
          const SizedBox(height: 16),
          _InfoCard(
            title: '☀️ Jarak dari Matahari',
            content: planet.jarakDariMatahari,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      color: colorScheme.surface,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(height: 16),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
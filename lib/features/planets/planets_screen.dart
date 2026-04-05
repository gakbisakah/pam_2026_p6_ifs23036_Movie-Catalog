// lib/features/planets/planets_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/route_constants.dart';
import '../../data/dummy_data.dart';
import '../../data/models/planet_model.dart';
import '../../shared/widget/top_app_bar_widget.dart';

class PlanetsScreen extends StatefulWidget {
  const PlanetsScreen({super.key});

  @override
  State<PlanetsScreen> createState() => _PlanetsScreenState();
}

class _PlanetsScreenState extends State<PlanetsScreen> {
  List<PlanetModel> _planets = DummyData.getPlanetsData();
  String _searchQuery = '';

  void _onSearchQueryChange(String query) {
    setState(() {
      _searchQuery = query;
      _planets = DummyData.getPlanetsData()
          .where(
              (p) => p.nama.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBarWidget(
        title: 'Tata Surya',
        withSearch: true,
        searchQuery: _searchQuery,
        onSearchQueryChange: _onSearchQueryChange,
      ),
      body: _PlanetsBody(
        planets: _planets,
        onOpen: (planetName) {
          context.go('${RouteConstants.planets}/$planetName');
        },
      ),
    );
  }
}

class _PlanetsBody extends StatelessWidget {
  const _PlanetsBody({required this.planets, required this.onOpen});

  final List<PlanetModel> planets;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    if (planets.isEmpty) {
      return Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Tidak ada data!',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: planets.length,
      itemBuilder: (context, index) {
        return _PlanetItemCard(
          planet: planets[index],
          onOpen: onOpen,
        );
      },
    );
  }
}

class _PlanetItemCard extends StatelessWidget {
  const _PlanetItemCard({required this.planet, required this.onOpen});

  final PlanetModel planet;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      color: colorScheme.surface,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onOpen(planet.nama),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  planet.gambar,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.public,
                      color: colorScheme.primary,
                      size: 36,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planet.nama,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '🪐 ${planet.jarakDariMatahari}',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      planet.deskripsi,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
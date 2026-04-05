// lib/features/movies/movie_detail_screen.dart

import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../data/models/movie_model.dart';
import '../../shared/widget/loading_widget.dart';
import '../../shared/widget/top_app_bar_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.movieId});

  final String movieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieModel? _movie;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final result = DummyData.getMoviesData()
          .where((m) => m.id == widget.movieId)
          .firstOrNull;
      if (mounted) {
        setState(() => _movie = result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_movie == null) {
      return Scaffold(
        appBar: TopAppBarWidget(
          title: 'Detail Film',
          showBackButton: true,
        ),
        body: const LoadingWidget(),
      );
    }

    return Scaffold(
      appBar: TopAppBarWidget(
        title: _movie!.title,
        showBackButton: true,
      ),
      body: _MovieDetailBody(movie: _movie!),
    );
  }
}

class _MovieDetailBody extends StatelessWidget {
  const _MovieDetailBody({required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                movie.posterPath,
                width: 200,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.movie,
                    size: 80,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            movie.title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 24),
              const SizedBox(width: 4),
              Text(
                movie.rating.toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                movie.releaseDate,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: movie.genre.split(', ').map((g) {
              return Chip(
                label: Text(g),
                backgroundColor: colorScheme.secondaryContainer,
                labelStyle: TextStyle(color: colorScheme.onSecondaryContainer),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text(
            'Sinopsis',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.overview,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
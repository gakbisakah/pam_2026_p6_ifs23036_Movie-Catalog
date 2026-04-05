// lib/features/movies/movies_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/route_constants.dart';
import '../../data/dummy_data.dart';
import '../../data/models/movie_model.dart';
import '../../shared/widget/top_app_bar_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<MovieModel> _movies = DummyData.getMoviesData();
  String _searchQuery = '';

  void _onSearchQueryChange(String query) {
    setState(() {
      _searchQuery = query;
      _movies = DummyData.getMoviesData()
          .where(
              (m) => m.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBarWidget(
        title: 'Katalog Film',
        withSearch: true,
        searchQuery: _searchQuery,
        onSearchQueryChange: _onSearchQueryChange,
      ),
      body: _MoviesBody(
        movies: _movies,
        onOpen: (movieId) {
          context.go('${RouteConstants.movies}/$movieId');
        },
      ),
    );
  }
}

class _MoviesBody extends StatelessWidget {
  const _MoviesBody({required this.movies, required this.onOpen});

  final List<MovieModel> movies;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Film tidak ditemukan!',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return _MovieItemCard(
          movie: movies[index],
          onOpen: onOpen,
        );
      },
    );
  }
}

class _MovieItemCard extends StatelessWidget {
  const _MovieItemCard({required this.movie, required this.onOpen});

  final MovieModel movie;
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
        onTap: () => onOpen(movie.id),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  movie.posterPath,
                  width: 70,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70,
                    height: 100,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.movie,
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
                      movie.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          movie.rating.toString(),
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          movie.genre,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movie.overview,
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
// lib/data/models/movie_model.dart

/// Model data untuk film
class MovieModel {
  const MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.rating,
    required this.releaseDate,
    required this.genre,
  });

  final String id;
  final String title;
  final String posterPath; // Path asset atau URL
  final String overview;
  final double rating;
  final String releaseDate;
  final String genre;

  MovieModel copyWith({
    String? id,
    String? title,
    String? posterPath,
    String? overview,
    double? rating,
    String? releaseDate,
    String? genre,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
      rating: rating ?? this.rating,
      releaseDate: releaseDate ?? this.releaseDate,
      genre: genre ?? this.genre,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'MovieModel(title: $title)';
}
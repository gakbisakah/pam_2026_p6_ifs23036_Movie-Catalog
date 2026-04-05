// lib/data/dummy_data.dart

import 'models/movie_model.dart';

class DummyData {
  DummyData._();

  static List<MovieModel> getMoviesData() {
    return const [
      MovieModel(
        id: '1',
        title: 'Inception',
        posterPath: 'assets/images/img_inception.png',
        overview: 'Seorang pencuri yang mencuri rahasia perusahaan melalui penggunaan teknologi berbagi mimpi diberi tugas sebaliknya: menanamkan ide ke dalam pikiran seorang CEO.',
        rating: 8.8,
        releaseDate: '2010-07-16',
        genre: 'Sci-Fi, Action',
      ),
      MovieModel(
        id: '2',
        title: 'The Dark Knight',
        posterPath: 'assets/images/img_dark_knight.png',
        overview: 'Ketika ancaman yang dikenal sebagai Joker muncul dari masa lalunya yang misterius, ia menyebabkan kekacauan pada orang-orang Gotham.',
        rating: 9.0,
        releaseDate: '2008-07-18',
        genre: 'Action, Crime, Drama',
      ),
      MovieModel(
        id: '3',
        title: 'Interstellar',
        posterPath: 'assets/images/img_interstellar.png',
        overview: 'Sekelompok penjelajah melakukan perjalanan melalui lubang cacing di luar angkasa dalam upaya untuk memastikan kelangsungan hidup umat manusia.',
        rating: 8.7,
        releaseDate: '2014-11-07',
        genre: 'Sci-Fi, Drama, Adventure',
      ),
      MovieModel(
        id: '4',
        title: 'The Godfather',
        posterPath: 'assets/images/img_godfather.png',
        overview: 'Seorang bapak tua dari dinasti kejahatan terorganisir mentransfer kontrol kekaisaran rahasianya kepada putranya yang enggan.',
        rating: 9.2,
        releaseDate: '1922-03-24',
        genre: 'Crime, Drama',
      ),
      MovieModel(
        id: '5',
        title: 'Pulp Fiction',
        posterPath: 'assets/images/img_pulp_fiction.png',
        overview: 'Kehidupan dua pembunuh bayaran mafia, seorang petinju, istri gangster, dan sepasang perampok restoran terjalin dalam empat kisah kekerasan dan penebusan.',
        rating: 8.9,
        releaseDate: '1994-10-14',
        genre: 'Crime, Drama',
      ),
      MovieModel(
        id: '6',
        title: 'The Shawshank Redemption',
        posterPath: 'assets/images/img_shawshank.png',
        overview: 'Dua orang narapidana menjalin persahabatan selama bertahun-tahun, menemukan pelipur lara dan penebusan akhirnya melalui tindakan kesusilaan yang umum.',
        rating: 9.3,
        releaseDate: '1994-09-22',
        genre: 'Drama',
      ),
    ];
  }
}
// lib/data/models/planet_model.dart

/// Model data untuk planet / objek tata surya
class PlanetModel {
  const PlanetModel({
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.faktaMenarik,
    required this.jarakDariMatahari,
  });

  final String nama;
  final String gambar;          // Path asset
  final String deskripsi;
  final String faktaMenarik;    // Menggantikan "manfaat"
  final String jarakDariMatahari; // Menggantikan "efekSamping"

  PlanetModel copyWith({
    String? nama,
    String? gambar,
    String? deskripsi,
    String? faktaMenarik,
    String? jarakDariMatahari,
  }) {
    return PlanetModel(
      nama: nama ?? this.nama,
      gambar: gambar ?? this.gambar,
      deskripsi: deskripsi ?? this.deskripsi,
      faktaMenarik: faktaMenarik ?? this.faktaMenarik,
      jarakDariMatahari: jarakDariMatahari ?? this.jarakDariMatahari,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PlanetModel &&
              runtimeType == other.runtimeType &&
              nama == other.nama;

  @override
  int get hashCode => nama.hashCode;

  @override
  String toString() => 'PlanetModel(nama: $nama)';
}
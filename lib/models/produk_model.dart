class ProdukModel {
  final String nama;
  final String kategori;
  final int harga;
  final String satuan;
  final String deskripsi;
  final String gambarUrl;
  final double rating;

  const ProdukModel({
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.satuan,
    required this.deskripsi,
    required this.gambarUrl,
    required this.rating,
  });
}
import 'package:flutter/material.dart';

void main() {
  runApp(const KatalogUmkmApp());
}

// 1. Class Model Data (Memiliki minimal 3 properti utama + tambahan detail)
class ProdukItem {
  final String nama;
  final String kategori;
  final int harga;
  final String deskripsi;
  final String gambarUrl;
  final double rating;

  const ProdukItem({
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.deskripsi,
    required this.gambarUrl,
    required this.rating,
  });
}

class KatalogUmkmApp extends StatelessWidget {
  const KatalogUmkmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog UMKM Sidoarjo',
      // 5. Tema Material 3 dengan warna yang hangat dan modern
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE65100), // Nuansa Oranye UMKM/Kuliner
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const KatalogHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KatalogHomePage extends StatelessWidget {
  const KatalogHomePage({super.key});

  // 2. List berisi minimal 8 data produk UMKM Sidoarjo
  final List<ProdukItem> daftarProduk = const [
    ProdukItem(
      nama: 'Bandeng Presto Sidoarjo',
      kategori: 'Makanan Khas',
      harga: 45000,
      deskripsi: 'Bandeng duri lunak khas Sidoarjo yang diolah dengan rempah pilihan, gurih, higienis, dan lezat disantap dengan sambal petis.',
      gambarUrl: 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500',
      rating: 4.8,
    ),
    ProdukItem(
      nama: 'Kerupuk Udang Finkom',
      kategori: 'Cemilan',
      harga: 20000,
      deskripsi: 'Kerupuk udang renyah khas pesisir Sidoarjo. Dibuat dari udang segar pilihan, sangat cocok untuk oleh-oleh atau teman makan.',
      gambarUrl: 'https://images.unsplash.com/photo-1599487484170-7c9e6e4cfe81?w=500',
      rating: 4.7,
    ),
    ProdukItem(
      nama: 'Petis Udang Asli Delta',
      kategori: 'Bumbu Dapur',
      harga: 15000,
      deskripsi: 'Petis udang murni berkualitas tinggi. Cocok sekali dipadukan untuk rujak cingur, tahu campur, maupun lontong balap khas Jawa Timur.',
      gambarUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500',
      rating: 4.9,
    ),
    ProdukItem(
      nama: 'Onde-Onde Bojonegoro',
      kategori: 'Kue Tradisional',
      harga: 12000,
      deskripsi: 'Kue onde-onde hangat isi kacang hijau yang empuk di dalam, bertabur wijen melimpah, manisnya pas dan nagih.',
      gambarUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500',
      rating: 4.6,
    ),
    ProdukItem(
      nama: 'Sambal Kupang Bu Siti',
      kategori: 'Kuliner',
      harga: 25000,
      deskripsi: 'Kupang segar khas Sidoarjo disiram kuah kaldu gurih berpadu sambal petis pedas nampol. Kuliner legendaris wajib coba!',
      gambarUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500',
      rating: 4.9,
    ),
    ProdukItem(
      nama: 'Kue Madumongso Legendaris',
      kategori: 'Kue Tradisional',
      harga: 30000,
      deskripsi: 'Jajanan tradisional berbahan dasar ketan hitam yang diolah fermentasi tape lalu dimasak lama dengan santan dan gula merah.',
      gambarUrl: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=500',
      rating: 4.5,
    ),
    ProdukItem(
      nama: 'Terasi Udang Murni',
      kategori: 'Bumbu Dapur',
      harga: 18000,
      deskripsi: 'Terasi udang berkualitas cetak super dengan aroma khas yang kuat dan sedap untuk memperkaya masakan rumah.',
      gambarUrl: 'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=500',
      rating: 4.7,
    ),
    ProdukItem(
      nama: 'Kecap Manis UD Lokal',
      kategori: 'Sembako',
      harga: 16000,
      deskripsi: 'Kecap manis kental dari ekstrak kedelai hitam pilihan asli Sidoarjo. Memberikan cita rasa karamel alami pada masakan.',
      gambarUrl: 'https://images.unsplash.com/photo-1472938883734-704332fb6d01?w=500',
      rating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Katalog UMKM Sidoarjo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
      ),
      // 3. Menggunakan ListView.builder
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0), // 6. Tampilan rapi konsisten
        itemCount: daftarProduk.length,
        itemBuilder: (context, index) {
          final produk = daftarProduk[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            // 4. Menggunakan Card + ListTile
            child: Card(
              elevation: 3,
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                // Ketika diklik, berpindah ke Halaman Detail yang interaktif!
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProdukPage(produk: produk),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        produk.gambarUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 60,
                          height: 60,
                          color: Colors.orange[100],
                          child: const Icon(Icons.store, color: Colors.orange),
                        ),
                      ),
                    ),
                    title: Text(
                      produk.nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            produk.kategori,
                            style: const TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp ${produk.harga.toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// HALAMAN KEDUA: DETAIL PRODUK (KETIKA DIKLIK)
// ==========================================
class DetailProdukPage extends StatelessWidget {
  final ProdukItem produk;

  const DetailProdukPage({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produk.nama),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Banner Produk di Detail
            Image.network(
              produk.gambarUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 250,
                color: Colors.orange[100],
                child: const Center(
                  child: Icon(Icons.store, size: 80, color: Colors.orange),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(produk.kategori),
                        backgroundColor: Colors.orange[100],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            produk.rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    produk.nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp ${produk.harga}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const Divider(height: 30),
                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    produk.deskripsi,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Pesanan untuk ${produk.nama} berhasil diproses!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart_checkout),
                      label: const Text(
                        'Pesan / Beli Produk Ini',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
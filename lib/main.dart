import 'package:flutter/material.dart';

void main() {
  runApp(const TokoBuahApp());
}

// 1. Class Model Data Produk Buah
class ProdukBuah {
  final String nama;
  final String kategori;
  final int harga;
  final String satuan;
  final String deskripsi;
  final String gambarUrl;
  final double rating;

  const ProdukBuah({
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.satuan,
    required this.deskripsi,
    required this.gambarUrl,
    required this.rating,
  });
}

class TokoBuahApp extends StatelessWidget {
  const TokoBuahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Buah Segar Nusantara',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      // Mulai dari Halaman Welcome/Sambutan dulu
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ==========================================
// 1. HALAMAN UTAMA / WELCOME SCREEN
// ==========================================
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B3B22), // Warna hijau gelap elegan ala alam
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.eco, color: Colors.greenAccent, size: 28),
                  SizedBox(width: 8),
                  Text(
                    'Nusantara Fresh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Gambar Ilustrasi / Banner Selamat Datang
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=600',
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Better Nutrition\nFor A Healthier You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Pilih buah segar pilihan berkualitas langsung dari petani lokal nusantara untuk kebugaran sehari-hari.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              // Tombol Masuk ke Beranda
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[700],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Navigasi ke Halaman Utama Katalog Beranda
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TokoBuahHomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Get Started Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 2. HALAMAN BERANDA / KATALOG (GRID 2 KOLOM)
// ==========================================
class TokoBuahHomePage extends StatelessWidget {
  const TokoBuahHomePage({super.key});

  // 8 Data Buah Segar
  final List<ProdukBuah> daftarBuah = const [
    ProdukBuah(
      nama: 'Apel Washington Super',
      kategori: 'Buah Impor',
      harga: 35000,
      satuan: 'kg',
      deskripsi: 'Apel Washington merah segar pilihan, manis, padat, dan kaya akan vitamin C serta serat alami.',
      gambarUrl: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500',
      rating: 4.9,
    ),
    ProdukBuah(
      nama: 'Pisang Cavendish Sunpride',
      kategori: 'Buah Lokal',
      harga: 22000,
      satuan: 'sisir',
      deskripsi: 'Pisang Cavendish berkualitas tinggi, kulit mulus berwarna kuning cerah, tekstur buah lembut dan manis.',
      gambarUrl: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500',
      rating: 4.8,
    ),
    ProdukBuah(
      nama: 'Jeruk Medan Manis',
      kategori: 'Buah Lokal',
      harga: 28000,
      satuan: 'kg',
      deskripsi: 'Jeruk segar asal Medan dengan kulit tipis, banyak kandungan air, serta rasa manis menyegarkan.',
      gambarUrl: 'https://images.unsplash.com/photo-1611080626919-7cf5a9dbab5b?w=500',
      rating: 4.7,
    ),
    ProdukBuah(
      nama: 'Mangga Harum Manis',
      kategori: 'Buah Musiman',
      harga: 30000,
      satuan: 'kg',
      deskripsi: 'Mangga matang pohon berkualitas super, daging buah tebal, harum khas, dan berasa manis legit.',
      gambarUrl: 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500',
      rating: 4.9,
    ),
    ProdukBuah(
      nama: 'Alpukat Mentega Pilihan',
      kategori: 'Buah Lokal',
      harga: 32000,
      satuan: 'kg',
      deskripsi: 'Alpukat mentega lokal pilihan dengan daging tebal berwarna kuning mentega, pulen, dan minim serat.',
      gambarUrl: 'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=500',
      rating: 4.8,
    ),
    ProdukBuah(
      nama: 'Semangka Merah Tanpa Biji',
      kategori: 'Buah Segar',
      harga: 18000,
      satuan: 'buah',
      deskripsi: 'Semangka merah segar ukuran sedang, kaya air, sangat cocok dikonsumsi saat cuaca panas.',
      gambarUrl: 'https://images.unsplash.com/photo-1587049352847-4a222e784d38?w=500',
      rating: 4.6,
    ),
    ProdukBuah(
      nama: 'Buah Naga Merah Organik',
      kategori: 'Buah Segar',
      harga: 25000,
      satuan: 'kg',
      deskripsi: 'Buah naga segar dengan daging merah pekat penuh biji hitam sehat, kaya antioksidan.',
      gambarUrl: 'https://images.unsplash.com/photo-1527661591475-527312dd65f5?w=500',
      rating: 4.7,
    ),
    ProdukBuah(
      nama: 'Anggur Merah Tanpa Biji',
      kategori: 'Buah Impor',
      harga: 45000,
      satuan: 'pack',
      deskripsi: 'Anggur merah impor segar pilihan, renyah saat digigit, dan memiliki rasa manis alami yang lezat.',
      gambarUrl: 'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=500',
      rating: 4.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Toko Buah Segar Nusantara',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.72,
        ),
        itemCount: daftarBuah.length,
        itemBuilder: (context, index) {
          final buah = daftarBuah[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailBuahPage(buah: buah),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.network(
                            buah.gambarUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.green[100],
                              child: const Center(
                                child: Icon(Icons.apple, color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          buah.nama,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp ${buah.harga} / ${buah.satuan}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              buah.rating.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 3. HALAMAN KEDUA: DETAIL PRODUK
// ==========================================
class DetailBuahPage extends StatelessWidget {
  final ProdukBuah buah;

  const DetailBuahPage({super.key, required this.buah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(buah.nama),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              buah.gambarUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          buah.kategori,
                          style: TextStyle(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            buah.rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    buah.nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp ${buah.harga} / ${buah.satuan}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const Divider(height: 30),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    buah.deskripsi,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B3B22),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Berhasil memesan ${buah.nama}!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text(
                        'Add to Cart',
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
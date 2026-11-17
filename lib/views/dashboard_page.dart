import 'package:flutter/material.dart';
import '../models/produk_model.dart';
import 'home_page.dart';
import 'detail_page.dart';
import 'cart_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.eco, color: Colors.green[700], size: 24),
            const SizedBox(width: 8),
            const Text(
              'Nusantara Fresh',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Banner Promo / Hero Section Utama
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[800]!, Colors.green[600]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[700],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Diskon Spesial Hari Ini 🎉',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Segarnya Buah Pilihan\nLangsung dari Petani Lokal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Jaminan 100% segar, manis, dan kaya vitamin untuk keluarga tercinta.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TokoBuahHomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Belanja Sekarang',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. Kategori Buah Interaktif
            const Text(
              'Kategori Pilihan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryItem(
                  context,
                  Icons.local_florist,
                  'Buah Lokal',
                  Colors.orange,
                ),
                _buildCategoryItem(
                  context,
                  Icons.public,
                  'Buah Impor',
                  Colors.blue,
                ),
                _buildCategoryItem(
                  context,
                  Icons.wb_sunny,
                  'Musiman',
                  Colors.amber,
                ),
                _buildCategoryItem(
                  context,
                  Icons.eco,
                  'Organik',
                  Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 3. Bagian Pilihan Katalog (Shortcut ke Halaman Utama)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Buah Segar Terlaris',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TokoBuahHomePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Lihat Semua',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // CARD 1: Apel Washington Super
            _buildProductCard(
              context,
              const ProdukModel(
                nama: 'Apel Washington Super',
                kategori: 'Buah Impor',
                harga: 35000,
                satuan: 'kg',
                deskripsi: 'Apel Washington merah segar pilihan, manis, padat, dan kaya akan vitamin C serta serat alami.',
                gambarUrl: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500',
                rating: 4.9,
              ),
            ),
            const SizedBox(height: 12),

            // CARD 2: Pisang Cavendish Sunpride
            _buildProductCard(
              context,
              const ProdukModel(
                nama: 'Pisang Cavendish Sunpride',
                kategori: 'Buah Lokal',
                harga: 22000,
                satuan: 'sisir',
                deskripsi: 'Pisang Cavendish berkualitas tinggi, kulit mulus berwarna kuning cerah, tekstur buah lembut dan manis.',
                gambarUrl: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500',
                rating: 4.8,
              ),
            ),
            const SizedBox(height: 12),

            // CARD 3: Jeruk Medan Manis
            _buildProductCard(
              context,
              const ProdukModel(
                nama: 'Jeruk Medan Manis',
                kategori: 'Buah Lokal',
                harga: 28000,
                satuan: 'kg',
                deskripsi: 'Jeruk segar asal Medan dengan kulit tipis, banyak kandungan air, serta rasa manis menyegarkan.',
                gambarUrl: 'https://images.unsplash.com/photo-1611080626919-7cf5a9dbab5b?w=500',
                rating: 4.7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Bantuan untuk Membuat Card Produk Terlaris
  Widget _buildProductCard(BuildContext context, ProdukModel produk) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(produk: produk),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                produk.gambarUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp ${produk.harga} / ${produk.satuan}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 4),
                      Text('${produk.rating} (Terlaris)', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // Widget Bantuan untuk Kategori yang Bisa Diklik
  Widget _buildCategoryItem(BuildContext context, IconData icon, String title, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryResultPage(selectedCategory: title),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// HALAMAN HASIL FILTER KATEGORI (CARD BISA DITEKAN)
// ==========================================
class CategoryResultPage extends StatelessWidget {
  final String selectedCategory;

  const CategoryResultPage({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final List<ProdukModel> semuaBuah = const [
      ProdukModel(
        nama: 'Apel Washington Super',
        kategori: 'Buah Impor',
        harga: 35000,
        satuan: 'kg',
        deskripsi: 'Apel Washington merah segar pilihan, manis, padat, dan kaya akan vitamin C serta serat alami.',
        gambarUrl: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500',
        rating: 4.9,
      ),
      ProdukModel(
        nama: 'Pisang Cavendish Sunpride',
        kategori: 'Buah Lokal',
        harga: 22000,
        satuan: 'sisir',
        deskripsi: 'Pisang Cavendish berkualitas tinggi, kulit mulus berwarna kuning cerah, tekstur buah lembut dan manis.',
        gambarUrl: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500',
        rating: 4.8,
      ),
      ProdukModel(
        nama: 'Jeruk Medan Manis',
        kategori: 'Buah Lokal',
        harga: 28000,
        satuan: 'kg',
        deskripsi: 'Jeruk segar asal Medan dengan kulit tipis, banyak kandungan air, serta rasa manis menyegarkan.',
        gambarUrl: 'https://images.unsplash.com/photo-1611080626919-7cf5a9dbab5b?w=500',
        rating: 4.7,
      ),
      ProdukModel(
        nama: 'Mangga Harum Manis',
        kategori: 'Musiman',
        harga: 30000,
        satuan: 'kg',
        deskripsi: 'Mangga matang pohon berkualitas super, daging buah tebal, harum khas, dan berasa manis legit.',
        gambarUrl: 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=500',
        rating: 4.9,
      ),
      ProdukModel(
        nama: 'Alpukat Mentega Sidoarjo',
        kategori: 'Buah Lokal',
        harga: 32000,
        satuan: 'kg',
        deskripsi: 'Alpukat mentega lokal pilihan dengan daging tebal berwarna kuning mentega, pulen, dan minim serat.',
        gambarUrl: 'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=500',
        rating: 4.8,
      ),
      ProdukModel(
        nama: 'Semangka Merah Tanpa Biji',
        kategori: 'Buah Segar',
        harga: 18000,
        satuan: 'buah',
        deskripsi: 'Semangka merah segar ukuran sedang, kaya air, sangat cocok dikonsumsi saat cuaca panas.',
        gambarUrl: 'https://images.unsplash.com/photo-1587049352847-4a222e784d38?w=500',
        rating: 4.6,
      ),
      ProdukModel(
        nama: 'Buah Naga Merah Organik',
        kategori: 'Organik',
        harga: 25000,
        satuan: 'kg',
        deskripsi: 'Buah naga segar dengan daging merah pekat penuh biji hitam sehat, kaya antioksidan.',
        gambarUrl: 'https://images.unsplash.com/photo-1527661591475-527312dd65f5?w=500',
        rating: 4.7,
      ),
      ProdukModel(
        nama: 'Anggur Merah Manis Tanpa Biji',
        kategori: 'Buah Impor',
        harga: 45000,
        satuan: 'pack',
        deskripsi: 'Anggur merah impor segar pilihan, renyah saat digigit, dan memiliki rasa manis alami yang lezat.',
        gambarUrl: 'https://images.unsplash.com/photo-1537640538966-79f369143f8f?w=500',
        rating: 4.9,
      ),
    ];

    final filteredBuah = semuaBuah.where((buah) {
      return buah.kategori.toLowerCase().contains(selectedCategory.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori: $selectedCategory'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: filteredBuah.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 60, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              'Belum ada produk untuk kategori "$selectedCategory"',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.72,
        ),
        itemCount: filteredBuah.length,
        itemBuilder: (context, index) {
          final buah = filteredBuah[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(produk: buah),
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
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                        buah.gambarUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
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
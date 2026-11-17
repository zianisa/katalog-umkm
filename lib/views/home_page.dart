import 'package:flutter/material.dart';
import '../models/produk_model.dart';
import 'detail_page.dart'; // Pastikan detail_page diimpor jika diperlukan

class TokoBuahHomePage extends StatelessWidget {
  const TokoBuahHomePage({super.key});

  final List<ProdukModel> daftarBuah = const [
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
      kategori: 'Buah Lokal/Impor',
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
      kategori: 'Buah Musiman',
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
      kategori: 'Buah Segar',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F3),
      appBar: AppBar(
        title: const Text(
          'Toko Buah Segar Nusantara',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: daftarBuah.length,
        itemBuilder: (context, index) {
          final buah = daftarBuah[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(produk: buah),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        buah.gambarUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 60,
                          height: 60,
                          color: Colors.green[100],
                          child: const Icon(Icons.apple, color: Colors.green),
                        ),
                      ),
                    ),
                    title: Text(
                      buah.nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          'Kategori: ${buah.kategori}',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Rp ${buah.harga} / ${buah.satuan}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
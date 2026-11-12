import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 1. Class Model untuk Data (Memiliki minimal 3 properti: nama, kategori, harga, deskripsi)
class ProdukItem {
  final String nama;
  final String kategori;
  final int harga;
  final String deskripsi;

  const ProdukItem({
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.deskripsi,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Produk UMKM',
      // 5. Menggunakan Tema Material 3
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const KatalogPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  // 2. List berisi minimal 8 data produk UMKM/Toko
  final List<ProdukItem> daftarProduk = const [
    ProdukItem(
      nama: 'Bandeng Presto Sidoarjo',
      kategori: 'Makanan Khas',
      harga: 45000,
      deskripsi: 'Bandeng duri lunak khas Sidoarjo yang gurih dan lezat.',
    ),
    ProdukItem(
      nama: 'Kerupuk Udang Finkom',
      kategori: 'Cemilan',
      harga: 20000,
      deskripsi: 'Kerupuk udang renyah khas Sidoarjo siap goreng.',
    ),
    ProdukItem(
      nama: 'Petis Udang Asli',
      kategori: 'Bumbu Dapur',
      harga: 15000,
      deskripsi: 'Petis udang pilihan cocok untuk rujak dan lontong balap.',
    ),
    ProdukItem(
      nama: 'Onde-Onde Bojonegoro',
      kategori: 'Kue Tradisional',
      harga: 12000,
      deskripsi: 'Kue onde-onde isi kacang hijau empuk dan manis.',
    ),
    ProdukItem(
      nama: 'Sambal Kupang',
      kategori: 'Kuliner',
      harga: 25000,
      deskripsi: 'Sambal petis dengan tambahan kerang kupang segar.',
    ),
    ProdukItem(
      nama: 'Kue Madumongso',
      kategori: 'Kue Tradisional',
      harga: 30000,
      deskripsi: 'Jajanan tradisional berbahan ketan hitam manis legit.',
    ),
    ProdukItem(
      nama: 'Terasi Udang Delta',
      kategori: 'Bumbu Dapur',
      harga: 18000,
      deskripsi: 'Terasi udang murni dengan aroma khas yang kuat.',
    ),
    ProdukItem(
      nama: 'Kecap Manis UMKM',
      kategori: 'Sembako',
      harga: 16000,
      deskripsi: 'Kecap manis kental dari kedelai hitam pilihan.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 5. AppBar berjudul & Tema Material 3
      appBar: AppBar(
        title: const Text('Katalog Produk UMKM Sidoarjo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // 3. Menggunakan ListView.builder untuk menampilkan data dinamis
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0), // 6. Tampilan rapi dengan padding konsisten
        itemCount: daftarProduk.length,
        itemBuilder: (context, index) {
          final produk = daftarProduk[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            // 4. Setiap item memakai Card + ListTile
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  produk.nama,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text('Kategori: ${produk.kategori}'),
                    Text('Harga: Rp ${produk.harga}'),
                    const SizedBox(height: 2),
                    Text(
                      produk.deskripsi,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                isThreeLine: true,
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kamu memilih ${produk.nama}')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
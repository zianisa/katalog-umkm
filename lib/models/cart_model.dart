import '../models/produk_model.dart';

class CartItem {
  final ProdukModel produk;
  int jumlah;
  bool isPilih; // Status apakah produk dicentang untuk dibeli

  CartItem({required this.produk, this.jumlah = 1, this.isPilih = true});
}

class CartData {
  static final List<CartItem> items = [];

  static void tambahProduk(ProdukModel produk) {
    final index = items.indexWhere((item) => item.produk.nama == produk.nama);
    if (index >= 0) {
      items[index].jumlah += 1;
    } else {
      items.add(CartItem(produk: produk));
    }
  }

  // Menghitung total harga hanya untuk item yang dicentang (isPilih == true)
  static int totalHarga() {
    int total = 0;
    for (var item in items) {
      if (item.isPilih) {
        total += (item.produk.harga * item.jumlah);
      }
    }
    return total;
  }

  static void clear() {
    items.clear();
  }
}
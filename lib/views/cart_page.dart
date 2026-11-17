import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import 'CheckoutPaymentPage.dart'; // <--- Tambahkan impor ini (sesuaikan dengan nama file tempat CheckoutPaymentPage berada)

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: CartData.items.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            const Text(
              'Keranjang belanjaanmu masih kosong',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: CartData.items.length,
              itemBuilder: (context, index) {
                final cartItem = CartData.items[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        // Checkbox untuk memilih produk yang mau di-checkout
                        Checkbox(
                          activeColor: Colors.green[700],
                          value: cartItem.isPilih,
                          onChanged: (bool? value) {
                            setState(() {
                              cartItem.isPilih = value ?? true;
                            });
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            cartItem.produk.gambarUrl,
                            width: 55,
                            height: 55,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.produk.nama,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Rp ${cartItem.produk.harga}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Tombol Atur Jumlah (+ / -)
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (cartItem.jumlah > 1) {
                                    cartItem.jumlah--;
                                  } else {
                                    CartData.items.removeAt(index);
                                  }
                                });
                              },
                              child: const Icon(Icons.remove_circle_outline, size: 20, color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '${cartItem.jumlah}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  cartItem.jumlah++;
                                });
                              },
                              child: const Icon(Icons.add_circle_outline, size: 20, color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Bagian Bawah: Total & Tombol Checkout
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Terpilih:',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      'Rp ${CartData.totalHarga()}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: CartData.totalHarga() == 0
                        ? null // Nonaktifkan tombol jika tidak ada yang dicentang
                        : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutPaymentPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Lanjut ke Pembayaran VA',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
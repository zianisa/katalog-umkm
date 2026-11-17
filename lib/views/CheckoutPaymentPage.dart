import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import 'CheckoutPaymentPage.dart'; // <--- Impor file checkout-mu di sini

class CheckoutPaymentPage extends StatefulWidget {
  const CheckoutPaymentPage({super.key});

  @override
  State<CheckoutPaymentPage> createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPaymentPage> {
  String selectedBank = 'BCA'; // Bank default

  final Map<String, String> bankVaNumbers = {
    'BCA': '8801482930112233',
    'Mandiri': '8900829102837465',
    'BNI': '9881234567890123',
    'BRI': '7770182938475612',
  };

  @override
  Widget build(BuildContext context) {
    String nomorVa = bankVaNumbers[selectedBank]!;
    int totalTagihan = CartData.totalHarga();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran Virtual Account'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Metode Pembayaran (Virtual Account)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Pilihan Bank VA
            _buildBankOption('BCA', 'BCA Virtual Account', Icons.account_balance),
            _buildBankOption('Mandiri', 'Mandiri Virtual Account', Icons.account_balance),
            _buildBankOption('BNI', 'BNI Virtual Account', Icons.account_balance),
            _buildBankOption('BRI', 'BRI Virtual Account', Icons.account_balance),

            const Divider(height: 40),

            // Kotak Informasi Tagihan & Nomor VA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Tagihan:', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text(
                        'Rp $totalTagihan',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Text(
                    'Nomor Virtual Account ($selectedBank):',
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        nomorVa,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Nomor VA berhasil disalin!')),
                          );
                        },
                        icon: const Icon(Icons.copy, size: 16),
                        label: const Text('Salin'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Tombol Konfirmasi Bayar
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutSuccessPage(),
                    ),
                  );
                },
                child: const Text(
                  'Cek Status Pembayaran',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankOption(String bankName, String subtitle, IconData icon) {
    bool isSelected = selectedBank == bankName;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green[50] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: RadioListTile(
        title: Text(bankName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        secondary: Icon(icon, color: isSelected ? Colors.green : Colors.grey),
        value: bankName,
        groupValue: selectedBank,
        activeColor: Colors.green[700],
        onChanged: (String? value) {
          setState(() {
            selectedBank = value!;
          });
        },
      ),
    );
  }
}

// ==========================================
// HALAMAN SUKSES PEMBAYARAN
// ==========================================
class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 24),
            const Text(
              'Pembayaran Berhasil! 🎉',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Pembayaran Virtual Account kamu telah dikonfirmasi. Pesanan buah segar Nusantara sedang disiapkan oleh penjual.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 40),
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
                onPressed: () {
                  CartData.clear(); // Bersihkan keranjang
                  Navigator.popUntil(context, (route) => route.isFirst); // Kembali ke halaman utama/landing page
                },
                child: const Text(
                  'Kembali ke Beranda',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
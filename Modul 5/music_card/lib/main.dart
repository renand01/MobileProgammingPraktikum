import 'package:flutter/material.dart';

void main() {
  runApp(const MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      // a. Gunakan ThemeData.dark() agar tampilan terlihat gelap dan elegan
      theme: ThemeData.dark(),
      home: const MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // b. Judul aplikasi pada AppBar "Sedang memutar" dan centerTitle: true
      appBar: AppBar(
        title: const Text('Sedang memutar'),
        centerTitle: true,
      ),
      // c. Tempatkan widget Card di bagian tengah layar menggunakan Center
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            // d. Properti Card sesuai spesifikasi
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Cover album (ikon musik)
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.album,
                      size: 80,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Baris informasi lagu, nama artis, dan tombol like
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Di sini ada judul lagu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Di sini ada nama artis',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      // Penggunaan Spacer agar tombol aksi bergeser ke ujung kanan
                      const Spacer(),

                      // Tombol aksi seperti (like)
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
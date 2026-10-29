import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemutar Musik',
      // a. Gunakan theme aplikasi dengan ThemeData.dark()
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
      appBar: AppBar(
        title: const Text('Music Player'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Tampilan Pemutar Musik',
          style: TextStyle(fontSize: 18),
        ),
      ),
      // b. Letakkan Control Bar di bagian bawah layar menggunakan bottomNavigationBar
      bottomNavigationBar: Container(
        // c. Beri padding symmetric(horizontal: 8, vertical: 10) dan warna latar gelap
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        color: Colors.black54,
        child: Row(
          children: [
            // e. Expanded untuk Shuffle
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shuffle, color: Colors.white),
              ),
            ),
            // e. Expanded untuk Previous
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous, color: Colors.white),
              ),
            ),
            // f. Flexible dengan flex: 2 dan fit: FlexFit.tight khusus tombol Play
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: IconButton(
                onPressed: () {},
                iconSize: 48.0, // Dibuat lebih besar agar tampil proporsional
                icon: const Icon(Icons.play_circle_fill, color: Colors.white),
              ),
            ),
            // e. Expanded untuk Next
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next, color: Colors.white),
              ),
            ),
            // e. Expanded untuk Repeat
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.repeat, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
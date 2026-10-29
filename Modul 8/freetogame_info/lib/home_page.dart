import 'package:flutter/material.dart';
import 'models/game_model.dart';
import 'services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Game> _gameFuture;

  @override
  void initState() {
    super.initState();
    // Memanggil API dengan ID game 452 (atau id yang diinginkan)
    _gameFuture = ApiService.fetchGameDetail(452);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: FutureBuilder<Game>(
          future: _gameFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Colors.white));
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Terjadi Kesalahan: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('Data tidak ditemukan', style: TextStyle(color: Colors.white)),
              );
            }

            final game = snapshot.data!;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: InkWell(
                  onTap: () {
                    // Berpindah ke Halaman Detail membawa data Game
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: game,
                    );
                  },
                  borderRadius: BorderRadius.circular(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              game.thumbnail,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 100),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            game.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Genre: ${game.genre}',
                                    style: const TextStyle(fontSize: 12.0, color: Colors.black87),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Platform: ${game.platform}',
                                    style: const TextStyle(fontSize: 12.0, color: Colors.black87),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Publisher: ${game.publisher}',
                                    style: const TextStyle(fontSize: 12.0, color: Colors.black87),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Release: ${game.releaseDate}',
                                    style: const TextStyle(fontSize: 12.0, color: Colors.black87),
                                  ),
                                ],
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
          },
        ),
      ),
    );
  }
}
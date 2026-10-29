import 'package:flutter/material.dart';
import 'models/game_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima data game yang dikirim via ModalRoute arguments
    final game = ModalRoute.of(context)!.settings.arguments as Game;

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  game.thumbnail,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Text(
                  game.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    game.description,
                    style: const TextStyle(
                      fontSize: 13.0,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
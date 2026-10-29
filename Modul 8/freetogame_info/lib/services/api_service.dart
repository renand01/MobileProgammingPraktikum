import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game_model.dart';

class ApiService {
  // Mengambil detail game spesifik berdasarkan ID (contoh ID: 452)
  static Future<Game> fetchGameDetail(int gameId) async {
    final url = Uri.parse('https://www.freetogame.com/api/game?id=$gameId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Game.fromJson(data);
    } else {
      throw Exception('Gagal mengambil data game dari API');
    }
  }
}
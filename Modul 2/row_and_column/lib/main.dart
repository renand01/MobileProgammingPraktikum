import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row and Column'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Baris Pertama (2 Kotak)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakWarnaHeart(color: Colors.blue, label: 'Suka 1'),
                  SizedBox(width: 20),
                  KotakWarnaHeart(color: Colors.teal, label: 'Suka 2'),
                ],
              ),
              SizedBox(height: 20),
              // Baris Kedua (2 Kotak)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakWarnaHeart(color: Colors.indigo, label: 'Suka 3'),
                  SizedBox(width: 20),
                  KotakWarnaHeart(color: Colors.yellow, label: 'Suka 4'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget KotakWarnaHeart ditaruh langsung di bawah class MyApp
class KotakWarnaHeart extends StatelessWidget {
  final Color color;
  final String label;

  const KotakWarnaHeart({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
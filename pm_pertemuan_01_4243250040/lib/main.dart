import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Hello World')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello World!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('Nama  : Nama Kamu'),
              const Text('NIM   : 2305181001'),
              const Text('Kelas : TI-3A'),
              const SizedBox(height: 24),
              // Widget tambahan (minimal 1)
              ElevatedButton(
                onPressed: () {},
                child: const Text('Klik Saya'),
              ),
              const Icon(Icons.favorite, color: Colors.red, size: 40),
            ],
          ),
        ),
      ),
    );
  }
}
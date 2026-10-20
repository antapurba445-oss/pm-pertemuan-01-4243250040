import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _klik = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Nama  : Febrianta Immanuel Purba'),
                    Text('NIM   : 4243250040'),
                    Text('Kelas : PSIK 24D'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Jumlah klik: $_klik'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => setState(() => _klik++),
              child: const Text('Klik Saya'),
            ),
            const SizedBox(height: 8),
            const Icon(Icons.favorite, color: Colors.red, size: 40),
          ],
        ),
      ),
    );
  }
}
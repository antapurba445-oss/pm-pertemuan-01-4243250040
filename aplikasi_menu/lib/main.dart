// Tugas Rutin 5: Menu UMKM Kuliner (versi 2: Dapur Bolu Meranti)
// Nama: ................  NIM: ................
import 'package:flutter/material.dart';

class Menu {
  const Menu({required this.nama, required this.harga, required this.kategori});

  final String nama;
  final int harga;
  final String kategori;

  String get hargaRupiah =>
      'Rp${harga.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}';
}

// Ganti dengan data UMKM pilihanmu.
const namaUsaha = 'Dapur Bolu Meranti';
const daftarMenu = <Menu>[
  Menu(nama: 'Bolu Meranti', harga: 80000, kategori: 'Kue Basah'),
  Menu(nama: 'Bika Ambon', harga: 55000, kategori: 'Kue Basah'),
  Menu(nama: 'Pia Medan', harga: 30000, kategori: 'Kue Kering'),
  Menu(nama: 'Kacang Sihobuk', harga: 25000, kategori: 'Camilan'),
];

void main() => runApp(const MenuApp());

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: namaUsaha,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HalamanMenu(),
    );
  }
}

class HalamanMenu extends StatelessWidget {
  const HalamanMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu UMKM Kuliner')),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          const HeaderUmkm(),
          const KartuKontak(),
          ...daftarMenu.map((m) => KartuMenu(menu: m)),
        ],
      ),
    );
  }
}

class HeaderUmkm extends StatelessWidget {
  const HeaderUmkm({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    return Container(
      height: 200,
      width: double.infinity,
      color: skema.primaryContainer,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Letakkan foto di assets/header.jpg dan daftarkan di pubspec.yaml.
          Image.asset(
            'assets/header.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) => Icon(
              Icons.cake,
              size: 80,
              color: skema.onPrimaryContainer,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                namaUsaha,
                style: teks.headlineMedium?.copyWith(
                  color: skema.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KartuKontak extends StatelessWidget {
  const KartuKontak({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('0813-1111-2222'),
            subtitle: Text('Pesan lewat WhatsApp'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.storefront),
            title: Text('Jl. Meranti No. 5, Medan'),
            subtitle: Text('Toko'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('@dapurbolumeranti'),
            subtitle: Text('Instagram'),
          ),
        ],
      ),
    );
  }
}

class KartuMenu extends StatelessWidget {
  const KartuMenu({super.key, required this.menu});

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        isThreeLine: true,
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        leading: CircleAvatar(child: Text(menu.nama[0])),
        title: Text(menu.nama, style: teks.titleMedium),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(menu.hargaRupiah, style: teks.bodyMedium),
            const SizedBox(height: 4),
            Chip(label: Text(menu.kategori)),
          ],
        ),
        trailing: TombolFavorit(namaMenu: menu.nama),
      ),
    );
  }
}

class TombolFavorit extends StatefulWidget {
  const TombolFavorit({super.key, required this.namaMenu, this.awal = false});

  final String namaMenu;
  final bool awal;

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  late bool _favorit;

  @override
  void initState() {
    super.initState();
    _favorit = widget.awal;
  }

  void _ubah() {
    setState(() => _favorit = !_favorit);
    final pesan = _favorit
        ? '${widget.namaMenu} masuk daftar favorit'
        : '${widget.namaMenu} keluar dari daftar favorit';
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(pesan)));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _ubah,
      tooltip: 'Favorit',
      color: _favorit ? Theme.of(context).colorScheme.primary : null,
      icon: Icon(_favorit ? Icons.favorite : Icons.favorite_border),
    );
  }
}

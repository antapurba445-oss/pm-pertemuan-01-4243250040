import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aplikasi_menu/main.dart';

void main() {
  testWidgets('menu usaha tampil dan produk dapat ditambahkan ke favorit', (
    tester,
  ) async {
    await tester.pumpWidget(const MenuApp());
    await tester.pumpAndSettle();

    expect(find.text('Menu UMKM Kuliner'), findsOneWidget);

    final menuTile = find.ancestor(
      of: find.text('Bolu Meranti').last,
      matching: find.byType(ListTile),
    );
    await tester.ensureVisible(menuTile);
    await tester.tap(
      find.descendant(of: menuTile, matching: find.byTooltip('Favorit')),
    );
    await tester.pump();

    expect(find.text('Bolu Meranti masuk daftar favorit'), findsOneWidget);
  });
}

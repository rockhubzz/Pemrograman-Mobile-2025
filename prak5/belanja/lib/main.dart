import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:belanja/models/item.dart';

void main() {
  runApp(const BelanjaApp());
}

class BelanjaApp extends StatelessWidget {
  const BelanjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Definisi router menggunakan GoRouter
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/item',
          builder: (context, state) {
            // Ambil data dari state.extra (pengganti ModalRoute)
            final item = state.extra as Item?;
            return ItemPage(item: item!);
          },
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Belanja App (GoRouter)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: router, // 🔹 Integrasi GoRouter
      debugShowCheckedModeBanner: false,
    );
  }
}

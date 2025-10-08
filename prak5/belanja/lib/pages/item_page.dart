import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.name,
              child: Image.network(item.imageUrl, height: 200),
            ),
            const SizedBox(height: 20),
            Text(item.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Harga: Rp ${item.price}'),
            Text('Stok: ${item.stock}'),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text('${item.rating}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

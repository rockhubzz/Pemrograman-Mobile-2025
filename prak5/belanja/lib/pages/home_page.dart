import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/item_card.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK31ZDuuuQiOGNnpsAm3mBEtbiQIdUh7_bow&s',
      stock: 20,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      imageUrl: 'https://cdn1.productnation.co/stg/sites/5/salt.jpg',
      stock: 30,
      rating: 4.2,
    ),
    Item(
      name: 'Rice',
      price: 10000,
      imageUrl: 'https://asset.kompas.com/crops/XDW60AQKAXtlPUPvfC-wBqns9gs=/0x13:592x408/1200x800/data/photo/2024/04/04/660de633def2a.jpeg',
      stock: 15,
      rating: 4.8,
    ),
    Item(
      name: 'Minyak Goreng',
      price: 20000,
      imageUrl: 'https://img-cdn.medkomtek.com/IKIcjh7kjiwuKmRIZ7IT0BDxl_M=/0x0/smart/filters:quality(100):format(webp)/article/3FA4VsIrYDsJWjB5WQBak/original/055464900_1570621563-Mengungkap-Manfaat-Minyak-Goreng-untuk-Kesehatan-Tubuh-By-Tim-UR-Shutterstock.jpg',
      stock: 15,
      rating: 4.8,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belanja App'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 3,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ItemCard(
                  item: item,
                  onTap: () {
                    context.push('/item', extra: item);

                  },
                );
              },
            ),
          ),

          // Footer dengan nama & NIM
          Container(
            color: Colors.blueAccent.withOpacity(0.1),
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Dibuat oleh: Rocky Alessandro Kristanto | NIM: 2341720197',
              style: TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

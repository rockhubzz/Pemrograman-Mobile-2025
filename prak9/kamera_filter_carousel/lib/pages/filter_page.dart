import 'dart:io';
import 'package:flutter/material.dart';
import '../widget/carousel_filter.dart';

class FilterPage extends StatefulWidget {
  final File imageFile;

  const FilterPage({super.key, required this.imageFile});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filter Foto")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ColorFiltered(
                colorFilter: filterList[selectedFilter],
                child: Image.file(widget.imageFile),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: CarouselFilter(
              onFilterSelected: (index) {
                setState(() => selectedFilter = index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

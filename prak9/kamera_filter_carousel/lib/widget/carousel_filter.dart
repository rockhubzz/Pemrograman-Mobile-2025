import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/rendering.dart';

// ------------------ FILTER LIST -------------------
final filterList = <ColorFilter>[
  const ColorFilter.mode(Colors.transparent, BlendMode.dst),
  const ColorFilter.mode(Colors.grey, BlendMode.saturation),
  const ColorFilter.mode(Colors.blueAccent, BlendMode.modulate),
  const ColorFilter.mode(Colors.redAccent, BlendMode.modulate),
  const ColorFilter.mode(Colors.yellowAccent, BlendMode.modulate),
];

// ------------------ CAROUSEL WIDGET -------------------
class CarouselFilter extends StatelessWidget {
  final ValueChanged<int> onFilterSelected;
  final ScrollController controller = ScrollController();

  CarouselFilter({super.key, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (_) {
        onFilterSelected(
          (controller.offset / 100).round().clamp(0, filterList.length - 1),
        );
        return true;
      },
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ColorFiltered(
                      colorFilter: filterList[index],
                      child: Image.asset(
                        "assets/sample.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text("Filter ${index + 1}"),
              ],
            ),
          );
        },
      ),
    );
  }
}

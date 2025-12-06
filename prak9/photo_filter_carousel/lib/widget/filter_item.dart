import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required this.color, this.onFilterSelected});

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: Image.network(
              'https://media.istockphoto.com/id/1315217913/photo/pink-millennial-rose-gold-cute-old-matte-grunge-faded-adobe-plaster-texture-abstract-cement.jpg?s=612x612&w=0&k=20&c=08Jhk3WoBNzLV6v5JZLWcrlLOzhLr1IG1X-1MJXSd-A=',
              color: color.withOpacity(0.5),
              colorBlendMode: BlendMode.hardLight,
            ),
          ),
        ),
      ),
    );
  }
}

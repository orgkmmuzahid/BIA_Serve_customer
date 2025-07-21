import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonRotatingImageBanner extends StatelessWidget {
  const CommonRotatingImageBanner({
    required this.imageUrls, required this.currentIndex, super.key,
    this.height = 200,
    this.fit = BoxFit.cover,
  });

  final List<String> imageUrls;
  final int currentIndex;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: imageUrls[currentIndex],
            height: height,
            width: double.infinity,
            fit: fit,
            placeholder: (context, url) => Container(
              height: height,
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Container(
              height: height,
              color: Colors.grey.shade200,
              child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imageUrls.length, (index) {
            final isActive = index == currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}

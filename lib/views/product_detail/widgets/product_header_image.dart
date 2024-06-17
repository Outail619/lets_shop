import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lets_shop/core/theme/app_spacings.dart';

class ProductHeaderImage extends StatelessWidget {
  final String imageUrl;
  const ProductHeaderImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacings.xxxl),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(colors: [
              Colors.orangeAccent,
              Colors.orangeAccent,
              Colors.orangeAccent,
              Colors.yellow.shade100,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Image(
            image: imageProvider,
          ),
        ),
      ),
    );
  }
}

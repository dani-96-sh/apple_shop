import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CachedImage extends StatelessWidget {
  String? imageUrl;
  BoxFit? boxFit;
  CachedImage({super.key, this.imageUrl, this.boxFit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: boxFit,
        placeholder: (context, url) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(12)),
          );
        },
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
              color: Colors.red[100], borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

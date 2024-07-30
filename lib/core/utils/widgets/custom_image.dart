import 'dart:convert';

import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
    this.isLocal,
  });

  final String imageUrl;
  final bool? isLocal;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: FadeInImage.assetNetwork(
        fit: BoxFit.fill,
        placeholderFit: BoxFit.scaleDown,

        image: imageUrl, placeholder: '',
      ),
    );
  }
}

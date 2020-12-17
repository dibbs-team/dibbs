import 'dart:io';

import 'package:flutter/material.dart';

import '../../../design/my_attributes.dart';

class ImageItem extends StatelessWidget {
  final File image;

  ImageItem(this.image);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: MyAttributes.imageAspectRatio,
      child: ClipRRect(
        borderRadius: MyAttributes.borderRadius,
        child: FittedBox(
          child: Image.file(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

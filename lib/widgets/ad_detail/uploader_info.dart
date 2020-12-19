import 'package:flutter/material.dart';

import '../../models/ad.dart';

class UploaderInfo extends StatelessWidget {
  final Uploader uploader;

  UploaderInfo(this.uploader);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(uploader.image),
        ),
        Text(uploader.name),
      ],
    );
  }
}

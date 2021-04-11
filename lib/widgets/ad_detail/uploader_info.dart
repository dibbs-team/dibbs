import 'package:flutter/material.dart';

class UploaderInfo extends StatelessWidget {
  final String uploaderInfo;
  final String image;

  UploaderInfo({required this.uploaderInfo, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32.0,
          backgroundImage: NetworkImage(image),
        ),
        const SizedBox(width: 12.0),
        Text(
          uploaderInfo,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../design/my_attributes.dart';

class AdItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: MyAttributes.imageAspectRatio,
              child: FittedBox(
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/4/44/3-4_ratio_mobile_wallpaper_example.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Title"),
                  Text("Community"),
                ],
              ),
            )
          ],
        ),
        onTap: () {},
      ),
    );
  }
}

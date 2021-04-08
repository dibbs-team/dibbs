import 'package:flutter/material.dart';

import '../../models/ad.dart';
import '../../design/my_attributes.dart';
import '../../design/app_theme.dart';
import '../../screens/ad_detail_screen.dart';

class AdItem extends StatelessWidget {
  final Ad ad;
  final Function onDetailClosed;

  AdItem(this.ad, {this.onDetailClosed});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: Column(
          children: [
            Hero(
              tag: ad.id,
              child: ClipRRect(
                borderRadius: MyAttributes.borderRadius,
                child: AspectRatio(
                  aspectRatio: MyAttributes.imageAspectRatio,
                  child: ad is ListAd
                      ? FadeInImage(
                          placeholder:
                              AssetImage('assets/images/ad-placeholder.png'),
                          image:
                              NetworkImage((ad as ListAd).images.elementAt(0)),
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          'assets/images/ad-placeholder.png',
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    ad.title,
                    style: AppTheme().themedata.textTheme.subtitle1,
                  ),
                  Text(
                    ad.price.toString(),
                    style: AppTheme().themedata.textTheme.headline6,
                  ),
                ],
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(
            AdDetailScreen.routeName,
            arguments: ad,
          )
              .then((bookingSuccessful) {
            if (bookingSuccessful) {
              onDetailClosed(bookingSuccessful);
            }
          });
        },
      ),
    );
  }
}

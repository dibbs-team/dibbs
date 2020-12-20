import 'package:flutter/material.dart';

import '../models/ad.dart';
import '../design/my_attributes.dart';
import '../lang/my_localizations.dart';
import '../widgets/ad_detail/uploader_info.dart';
import '../widgets/ad_detail/image_carousel.dart';

class AdDetailScreen extends StatelessWidget {
  static const routeName = '/ad-detail';

  @override
  Widget build(BuildContext context) {
    final ad = ModalRoute.of(context).settings.arguments as Ad;
    final screenWidth = MediaQuery.of(context).size.width;
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ad is ListAd
              ? SliverAppBar(
                  expandedHeight: screenWidth / MyAttributes.imageAspectRatio,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                      tag: ad.id,
                      child: ImageCarousel(ad.images),
                    ),
                  ),
                )
              : SliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(ad.title),
                Text(l10n.adPrice(ad.price)),
                UploaderInfo(ad.uploader),
                Text(ad.description),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: MyAttributes.borderRadiusTop,
        ),
        child: Text(l10n.dibbItem),
      ),
    );
  }
}

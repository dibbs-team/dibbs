import 'package:flutter/material.dart';

import 'book_list_ad_screen.dart';
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
          SliverPadding(
            padding: const EdgeInsets.all(36.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    ad.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    l10n.adPrice(ad.price),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Divider(),
                  Text(
                    l10n.description,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    ad.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Divider(),
                  UploaderInfo(
                    uploaderInfo: ad is ListAd
                        ? l10n.listAdUploaderName(ad.uploader.name)
                        : l10n.findAdUploaderName(ad.uploader.name),
                    image: ad.uploader.image,
                  ),
                  Divider(),
                  Text(
                    l10n.rentingRules,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    l10n.rentingRulesBody,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    '', //* Empty text to get same height as a new line.
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    l10n.cancellationTerms,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    l10n.cancellationTermsBody,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            BookListAdScreen.routeName,
            arguments: BookListAdScreenArguments(ad),
          ).then((bookingSuccessful) {
            if (bookingSuccessful) {
              Navigator.of(context).pop(bookingSuccessful);
            }
          });
        },
        child: Text(ad is ListAd ? l10n.dibbListAd : l10n.dibbFindAd),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: MyAttributes.borderRadiusTop,
          ),
        ),
      ),
    );
  }
}

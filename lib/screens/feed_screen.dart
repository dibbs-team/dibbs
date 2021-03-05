import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import '../lang/my_localizations.dart';
import '../design/my_attributes.dart';
import '../widgets/explore/ad_item.dart';
import '../widgets/explore/no_ads_display.dart';
import '../models/ad.dart';
import '../utils/firestore_values.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  DateTime _lastRefresh = DateTime.now();

  Future<void> _reloadAds() async {
    setState(() {
      //* This causes the key parameter in PaginateFirestore to change
      //* which rebuilds the entire widget with reloaded content.
      _lastRefresh = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);
    const spacing = 24.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.feedScreenTitle),
      ),
      body: RefreshIndicator(
        onRefresh: _reloadAds,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing),
          child: PaginateFirestore(
            itemBuilderType: PaginateBuilderType.gridView,
            itemBuilder: (index, ctx, documentSnapshot) =>
                AdItem(Ad.fromFirestoreObject(documentSnapshot)),
            query: FirebaseFirestore.instance.collection(Collection.ads).where(
                  Ads.complete,
                  isEqualTo: true,
                ),
            emptyDisplay: NoAdsDisplay(),
            itemsPerPage: 10,
            key: Key(_lastRefresh.toString()),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MyAttributes.imageAspectRatio * 0.85,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
            ),
          ),
        ),
      ),
    );
  }
}

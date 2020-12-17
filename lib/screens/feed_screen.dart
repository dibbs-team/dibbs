import 'package:flutter/material.dart';

import '../lang/my_localizations.dart';
import '../design/my_attributes.dart';
import '../widgets/explore/ad_item.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.feedScreenTitle),
      ),
      body: Container(
        margin: EdgeInsets.all(5.0),
        child: GridView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) => AdItem(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MyAttributes.imageAspectRatio * 6 / 7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}

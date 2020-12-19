import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class NoAdsDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return LayoutBuilder(
      //* This wraps the widget in a Scrollable which makes it possible to
      //* refresh when the widget is a descendent of a RefreshIndicator.
      builder: (ctx, constraints) => SingleChildScrollView(
        child: Container(
          height: constraints.maxHeight,
          child: Center(
            child: Text(l10n.noAds),
          ),
        ),
        physics: AlwaysScrollableScrollPhysics(),
      ),
    );
  }
}

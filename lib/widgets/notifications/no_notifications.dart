import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class NoNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Center(
      child: Text(
        l10n.noNotifications,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}

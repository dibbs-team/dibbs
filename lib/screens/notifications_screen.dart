import 'package:flutter/material.dart';

import '../lang/my_localizations.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.notificationsScreenTitle,
        ),
      ),
    );
  }
}

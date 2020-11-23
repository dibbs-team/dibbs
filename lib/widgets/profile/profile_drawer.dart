import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class ProfileDrawer extends StatelessWidget {
  final VoidCallback callback;

  ProfileDrawer({
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Drawer(
      child: RaisedButton(
        child: Text(l10n.signOut),
        onPressed: this.callback,
      ),
    );
  }
}

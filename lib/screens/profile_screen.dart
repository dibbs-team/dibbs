import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../lang/my_localizations.dart';

class ProfileScreen extends StatelessWidget {
  void signOut() {
    auth.FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileScreenTitle),
      ),
      body: Center(
        // TODO: Remove when profile screen is updated.
        child: RaisedButton(
          child: Text(l10n.signOut),
          onPressed: signOut,
        ),
      ),
    );
  }
}

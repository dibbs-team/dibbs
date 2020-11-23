import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../lang/my_localizations.dart';
import '../widgets/profile/profile_drawer.dart';

class ProfileScreen extends StatelessWidget {
  void signOut() {
    auth.FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      endDrawer: ProfileDrawer(callback: signOut),
      appBar: AppBar(
        title: Text(l10n.profileScreenTitle),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          child: const Text("Current user placeholder"),
        ),
      ),
    );
  }
}

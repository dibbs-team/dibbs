import 'package:flutter/material.dart';

import '../lang/my_localizations.dart';

class AddCommunityScreen extends StatelessWidget {
  static const routeName = '/add-community';

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      body: WillPopScope(
        //* Should not be able to pop using back button on Android.
        onWillPop: () async => false,
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            children: [
              const Spacer(flex: 4),
              Text(
                l10n.addCommunityInstruction,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: l10n.addCommunityInputHint,
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(flex: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  l10n.addCommunityDisclaimer,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32.0),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(l10n.addCommunityFinished),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../lang/my_localizations.dart';

class AddCommunityScreen extends StatelessWidget {
  final void Function() onFinished;

  AddCommunityScreen({@required this.onFinished});

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          children: [
            const Spacer(flex: 1),
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
            const Spacer(flex: 1),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: onFinished,
                child: Text(l10n.addCommunityFinished),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class AdTypeSelector extends StatelessWidget {
  final void Function() onSelectedFind;
  final void Function() onSelectedList;

  AdTypeSelector({
    this.onSelectedFind,
    this.onSelectedList,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Column(
      children: [
        const Spacer(flex: 2),
        Text(
          l10n.chooseUploadTypeHint,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 48.0),
        Row(
          children: [
            const Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: RaisedButton(
                onPressed: onSelectedFind,
                child: Text(l10n.uploadTypeFind.toUpperCase()),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: RaisedButton(
                onPressed: onSelectedList,
                child: Text(l10n.uploadTypeList.toUpperCase()),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'form_title.dart';
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
        FormTitle(l10n.chooseUploadTypeHint),
        const SizedBox(height: 48.0),
        Row(
          children: [
            const Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: OutlinedButton(
                onPressed: onSelectedFind,
                child: Text(l10n.uploadTypeFind.toUpperCase()),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: OutlinedButton(
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

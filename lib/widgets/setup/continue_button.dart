import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

import '../../lang/my_localizations.dart';

class ContinueButton extends StatelessWidget {
  final Future<void> Function() onPressed;
  final String community;

  ContinueButton({
    @required this.onPressed,
    @required this.community,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return TapDebouncer(
      onTap: onPressed,
      builder: (ctx, onTap) => ElevatedButton(
        child: Text(l10n.continueToCommunity(community)),
        onPressed: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

import '../../lang/my_localizations.dart';

class StepContainer extends StatelessWidget {
  final int step;
  final int totalSteps;
  final Future<void> Function() onButtonPressed;
  final Widget child;

  const StepContainer({
    @required this.step,
    @required this.totalSteps,
    @required this.onButtonPressed,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Column(
      children: [
        Expanded(child: child),
        Container(
          width: double.infinity,
          child: TapDebouncer(
            onTap: () async {
              await onButtonPressed();
            },
            builder: (ctx, onTap) => RaisedButton(
              child: Text(
                step == totalSteps ? l10n.uploadAd : l10n.nextStep,
              ),
              onPressed: onTap,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

import '../../lang/my_localizations.dart';

class UploadStepContainer extends StatelessWidget {
  final int step;
  final int totalSteps;
  final Future<void> Function() onButtonPressed;
  final Widget child;

  const UploadStepContainer({
    @required this.step,
    @required this.totalSteps,
    @required this.onButtonPressed,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Container(
      height: double.maxFinite,
      child: Stack(
        children: <Widget>[
          child,
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}

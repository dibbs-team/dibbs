import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

import '../../design/my_attributes.dart';
import '../../design/my_colors.dart';

class StepContainer extends StatelessWidget {
  final Future<void> Function() onButtonPressed;
  final Widget child;

  /// The text to be displayed on the button that trigger the onButtonPressed callback
  final String buttonText;

  const StepContainer({
    @required this.buttonText,
    @required this.onButtonPressed,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        Container(
          width: double.infinity,
          child: TapDebouncer(
            onTap: () async {
              await onButtonPressed();
            },
            builder: (ctx, onTap) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: MyColors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: MyAttributes.borderRadiusTop),
              ),
              child: Text(
                buttonText,
              ),
              onPressed: onTap,
            ),
          ),
        )
      ],
    );
  }
}

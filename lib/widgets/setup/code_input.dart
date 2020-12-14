import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../design/my_colors.dart';

class CodeInput extends StatelessWidget {
  final Future<void> Function(String) onComplete;
  final void Function(String) onChanged;

  CodeInput({
    @required this.onComplete,
    this.onChanged,
  });

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: MyColors.lightGrey,
    borderRadius: BorderRadius.circular(12.0),
  );

  @override
  Widget build(BuildContext context) {
    return PinPut(
      fieldsCount: 4,
      fieldsAlignment: MainAxisAlignment.spaceAround,
      textStyle: const TextStyle(fontSize: 24.0),
      eachFieldHeight: 56.0,
      eachFieldWidth: 48.0,
      submittedFieldDecoration: pinPutDecoration,
      followingFieldDecoration: pinPutDecoration,
      selectedFieldDecoration: pinPutDecoration.copyWith(border: Border.all()),
      pinAnimationType: PinAnimationType.fade,
      onSubmit: onComplete,
      onChanged: onChanged,
    );
  }
}

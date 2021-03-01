import 'package:flutter/material.dart';

class FormFieldTitle extends StatelessWidget {
  final String fieldTitle;

  FormFieldTitle(this.fieldTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        fieldTitle,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}

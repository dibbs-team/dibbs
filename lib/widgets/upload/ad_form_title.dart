import 'package:flutter/material.dart';

class AdFormTitle extends StatelessWidget {
  final String title;

  AdFormTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title),
    );
  }
}

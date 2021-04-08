import 'package:flutter/material.dart';

class FormInfo extends StatelessWidget {
  final String info;

  FormInfo(this.info);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        info,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

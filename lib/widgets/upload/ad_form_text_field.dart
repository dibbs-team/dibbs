import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class AdFormTextField extends StatelessWidget {
  final String hint;
  final bool optional;
  final int lines;

  AdFormTextField({
    this.hint,
    this.optional = false,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return TextFormField(
      validator: (value) {
        if (!optional && value.isEmpty) {
          return l10n.requiredField;
        }
        return null;
      },
      decoration: InputDecoration(hintText: hint),
      keyboardType: lines == 1 ? TextInputType.name : TextInputType.multiline,
      minLines: lines,
      maxLines: lines,
    );
  }
}

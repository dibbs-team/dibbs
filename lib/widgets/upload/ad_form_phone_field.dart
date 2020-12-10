import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../lang/my_localizations.dart';

class AdFormPhoneField extends StatelessWidget {
  final String hint;
  final bool optional;

  AdFormPhoneField({
    this.hint,
    this.optional = false,
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
      keyboardType: TextInputType.phone,
    );
  }
}

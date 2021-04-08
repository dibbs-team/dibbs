import 'package:flutter/material.dart';

import 'form_title.dart';
import 'form_input_field.dart';
import 'upload_step.dart';
import '../../lang/my_localizations.dart';

class AdUploaderForm extends StatelessWidget implements UploadStep {
  final _formKey = GlobalKey<FormState>();

  @override
  bool validate() {
    return _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormTitle(l10n.findAdTermsTitle),
            Text(l10n.longTemp),
            FormTitle(l10n.adInputContactNr),
            Text(l10n.adInputPhoneInfo),
            FormInputField.phone(),
          ],
        ),
      ),
    );
  }
}

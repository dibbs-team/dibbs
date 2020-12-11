import 'package:flutter/material.dart';

import 'ad_form_title.dart';
import 'ad_form_text_field.dart';
import 'ad_form_number_field.dart';
import 'upload_step.dart';
import '../../lang/my_localizations.dart';

class ListAdDetailsForm extends UploadStep {
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
          children: [
            AdFormTitle(l10n.adDescriptionTitle),
            AdFormTextField(hint: l10n.formTitle),
            AdFormTextField(
              hint: l10n.description,
              lines: 12,
              optional: true,
            ),
            AdFormTitle(l10n.listAdPriceTitle),
            AdFormNumberField(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'ad_form_title.dart';
import 'ad_form_text_field.dart';
import 'ad_form_number_field.dart';
import 'ad_form_date_picker.dart';
import 'upload_step.dart';
import '../../lang/my_localizations.dart';

class FindAdDetailsForm extends UploadStep {
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
            AdFormTitle(l10n.findAdDescriptionTitle),
            AdFormTextField(hint: l10n.formTitle),
            AdFormTextField(
              hint: l10n.description,
              lines: 8,
              optional: true,
            ),
            AdFormTitle(l10n.findAdPriceTitle),
            AdFormNumberField(),
            AdFormTitle(l10n.findAdDateTitle),
            DateRangePicker(),
          ],
        ),
      ),
    );
  }
}
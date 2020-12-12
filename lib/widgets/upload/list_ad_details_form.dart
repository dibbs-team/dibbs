import 'package:flutter/material.dart';

import 'form_title.dart';
import 'form_input_field.dart';
import 'upload_step.dart';
import '../../lang/my_localizations.dart';

class ListAdDetailsForm extends UploadStep {
  final _formKey = GlobalKey<FormState>();

  // Handles to forms.
  final _titleField = FormInputField.title();
  final _descriptionField = FormInputField.description();
  final _priceField = FormInputField.price();

  String get title => _titleField.value;
  String get description => _descriptionField.value;
  int get price => int.parse(_priceField.value);

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
            FormTitle(l10n.listAdDescriptionTitle),
            _titleField,
            _descriptionField,
            FormTitle(l10n.listAdPriceTitle),
            _priceField,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'form_title.dart';
import 'form_input_field.dart';
import 'upload_step.dart';
import '../../utils/ad_types.dart';
import '../../lang/my_localizations.dart';

class ListAdDetailsForm extends StatelessWidget implements UploadStep {
  final _formKey = GlobalKey<FormState>();

  // Handles to forms.
  final _titleField = FormInputField.title();
  final _descriptionField = FormInputField.description(AdType.LIST);
  final _priceField = FormInputField.price(AdType.LIST);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormTitle(l10n.listAdTitle),
            _titleField,
            _descriptionField,
            _priceField,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'form_title.dart';
import 'form_input_field.dart';
import 'date_range_picker.dart';
import 'upload_step.dart';
import '../../lang/my_localizations.dart';

class FindAdDetailsForm extends UploadStep {
  final _formKey = GlobalKey<FormState>();

  // Handles to input fields.
  final _titleField = FormInputField.title();
  final _descriptionField = FormInputField.description();
  final _priceField = FormInputField.price();
  final _dateRangePicker = DateRangePicker();

  String get title => _titleField.value;
  String get description => _descriptionField.value;
  int get price => int.parse(_priceField.value);
  DateTimeRange get dates => _dateRangePicker.dates;

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
            FormTitle(l10n.findAdDescriptionTitle),
            _titleField,
            _descriptionField,
            FormTitle(l10n.findAdPriceTitle),
            _priceField,
            FormTitle(l10n.findAdDateTitle),
            _dateRangePicker,
          ],
        ),
      ),
    );
  }
}

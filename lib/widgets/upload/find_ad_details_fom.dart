import 'package:flutter/material.dart';

import 'form_field_title.dart';
import 'form_title.dart';
import 'form_input_field.dart';
import 'date_range_picker.dart';
import 'upload_step.dart';
import '../../utils/ad_types.dart';
import '../../lang/my_localizations.dart';

class FindAdDetailsForm extends UploadStep {
  final _formKey = GlobalKey<FormState>();

  // Handles to input fields.
  final _titleField = FormInputField.title();
  final _descriptionField = FormInputField.description(AdType.FIND);
  final _priceField = FormInputField.price(AdType.FIND);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormTitle(l10n.findAdTitle),
            _titleField,
            _descriptionField,
            _priceField,
            FormFieldTitle(l10n.findAdDateTitle),
            _dateRangePicker,
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}

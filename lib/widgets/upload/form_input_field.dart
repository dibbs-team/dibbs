import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../../lang/my_localizations.dart';

class FormInputField extends StatelessWidget {
  final _controller = TextEditingController();
  final _InputFormType type;
  final bool optional;

  String get value => _controller.text;

  FormInputField.title()
      : type = _InputFormType.TITLE,
        optional = false;
  FormInputField.description()
      : type = _InputFormType.DESCRIPTION,
        optional = true;
  FormInputField.price()
      : type = _InputFormType.PRICE,
        optional = false;
  FormInputField.phone()
      : type = _InputFormType.PHONE,
        optional = false;

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);
    final validator = (String value) {
      if (!optional && value.isEmpty) {
        return l10n.requiredField;
      }
      return null;
    };

    switch (type) {
      case _InputFormType.TITLE:
        return TextFormField(
          controller: _controller,
          validator: validator,
          decoration: InputDecoration(hintText: l10n.formTitle),
        );
      case _InputFormType.DESCRIPTION:
        return TextFormField(
          controller: _controller,
          validator: validator,
          decoration: InputDecoration(hintText: l10n.description),
          keyboardType: TextInputType.multiline,
          minLines: 10,
          maxLines: 15,
        );
      case _InputFormType.PRICE:
        return TextFormField(
          controller: _controller,
          validator: validator,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        );
      case _InputFormType.PHONE:
        return TextFormField(
          controller: _controller,
          validator: validator,
          keyboardType: TextInputType.phone,
        );
      default:
        Logger().w('Using TextFormField without formatting.');
        return TextFormField(
          controller: _controller,
          validator: validator,
        );
    }
  }
}

enum _InputFormType {
  TITLE,
  DESCRIPTION,
  PRICE,
  PHONE,
}

import 'form_field_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/ad_types.dart';
import '../../lang/my_localizations.dart';

class FormInputField extends StatelessWidget {
  final _controller = TextEditingController();
  final _InputFormType type;
  final bool optional;
  final TextFormField Function(
          MyLocalizations, String Function(String), TextEditingController)
      textFormField;
  final String Function(MyLocalizations) header;

  String get value => _controller.text;

  FormInputField.title()
      : type = _InputFormType.TITLE,
        optional = false,
        header = ((MyLocalizations l10n) => l10n.formTitle),
        textFormField = ((MyLocalizations l10n,
                String Function(String) validator, TextEditingController c) =>
            TextFormField(
              controller: c,
              validator: validator,
              decoration: InputDecoration(hintText: l10n.formTitle),
            ));

  FormInputField.description(AdType adType)
      : type = _InputFormType.DESCRIPTION,
        optional = true,
        header = ((MyLocalizations l10n) => adType == AdType.FIND
            ? l10n.findAdDescriptionTitle
            : l10n.listAdDescriptionTitle),
        textFormField = ((MyLocalizations l10n,
                String Function(String) validator, TextEditingController c) =>
            TextFormField(
              controller: c,
              validator: validator,
              decoration: InputDecoration(
                  hintText: adType == AdType.FIND
                      ? l10n.findAdDescriptionHint
                      : l10n.listAdDescriptionHint),
              keyboardType: TextInputType.multiline,
              minLines: 10,
              maxLines: 15,
            ));

  FormInputField.price(AdType adType)
      : type = _InputFormType.PRICE,
        optional = false,
        header = ((MyLocalizations l10n) => adType == AdType.FIND
            ? l10n.findAdPriceTitle
            : l10n.listAdPriceTitle),
        textFormField = ((MyLocalizations l10n,
                String Function(String) validator, TextEditingController c) =>
            TextFormField(
              controller: c,
              validator: validator,
              decoration: InputDecoration(
                  hintText: adType == AdType.FIND
                      ? l10n.findAdPriceHint
                      : l10n.listAdPriceHint),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ));

  FormInputField.phone()
      : type = _InputFormType.PHONE,
        optional = false,
        header = ((MyLocalizations l10n) => l10n.adInputPhoneTitle),
        textFormField = ((MyLocalizations l10n,
                String Function(String) validator, TextEditingController c) =>
            TextFormField(
              controller: c,
              validator: validator,
              decoration: InputDecoration(hintText: l10n.adInputPhoneHint),
              keyboardType: TextInputType.phone,
            ));

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);
    final validator = (String value) {
      if (!optional && value.isEmpty) {
        return l10n.requiredField;
      }
      return null;
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormFieldTitle(header(l10n)),
          textFormField(l10n, validator, _controller),
        ],
      ),
    );
  }
}

enum _InputFormType {
  TITLE,
  DESCRIPTION,
  PRICE,
  PHONE,
}

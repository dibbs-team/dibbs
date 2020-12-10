import 'package:flutter/material.dart';

import 'ad_form_title.dart';
import 'upload_step.dart';
import '../../lang/my_localizations.dart';

class ListAdImagesForm extends UploadStep {
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
      child: Column(
        children: [
          AdFormTitle("TODO"), // TODO
        ],
      ),
    );
  }
}

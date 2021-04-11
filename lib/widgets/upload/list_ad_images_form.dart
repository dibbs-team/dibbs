import 'dart:io';

import 'package:flutter/material.dart';

import 'form_title.dart';
import 'upload_step.dart';
import 'image_sequence_picker/image_sequence_picker.dart';
import '../../lang/my_localizations.dart';

class ListAdImagesForm extends StatelessWidget implements UploadStep {
  final imageSequencePicker = ImageSequencePicker(
    imagesPerRow: 3,
    maxItems: 6,
  );

  List<File> get images => imageSequencePicker.result!;

  @override
  bool validate() {
    return images.length > 0;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitle(l10n.listAdImagesTitle),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: imageSequencePicker,
        ),
      ],
    );
  }
}

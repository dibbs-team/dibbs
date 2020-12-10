import 'package:flutter/material.dart';

abstract class UploadStep extends StatelessWidget {
  /// Validates that all information in the step is correctly inputed.
  bool validate();

  @override
  Widget build(BuildContext context);
}

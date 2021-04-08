import 'package:flutter/material.dart';

abstract class UploadStep implements Widget {
  /// Validates that all information in the step is correctly inputed.
  bool validate();
}

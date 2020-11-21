import 'package:flutter/material.dart';

/// Shows a SnackBar with the given message in the Scaffold with the given key.
void showSnackbar({
  @required GlobalKey<ScaffoldState> key,
  @required String message,
}) {
  key.currentState.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

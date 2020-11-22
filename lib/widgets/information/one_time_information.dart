import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/loading_screen.dart';
import '../../screens/information_screen.dart';

/// Shows information once for every user then transitions to next screen.
/// If information has been shown previously it's skipped.
class OneTimeInformation extends StatefulWidget {
  final Widget showAfter;
  final showOnceIdentifier = 'seenInformationScreen';

  OneTimeInformation({
    @required this.showAfter,
  });

  @override
  _OneTimeInformationState createState() => _OneTimeInformationState();
}

class _OneTimeInformationState extends State<OneTimeInformation> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Checks if user has seen information before.
  Future<bool> _getSeenBefore() async {
    final SharedPreferences prefs = await _prefs;
    return (prefs.getBool(widget.showOnceIdentifier) ?? false);
  }

  /// Saves that the user has seen the widget before and transition to next.
  Future<void> _setSeenInfoBefore() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(widget.showOnceIdentifier, true);
    setState(() {}); //* Rebuild to transition to next screen.
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _getSeenBefore(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          var seenInfoBefore = snapshot.data;
          return seenInfoBefore
              ? widget.showAfter
              : InformationScreen(
                  onClose: _setSeenInfoBefore,
                );
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}

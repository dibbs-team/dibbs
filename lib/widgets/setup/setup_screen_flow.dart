import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../screens/tab_screen.dart';
import '../../screens/add_community_screen.dart';
import '../../screens/information_screen.dart';
import '../../utils/firestore_values.dart' as fs;

class SetupScreenFlow extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _showOnceIdentifier = 'seenInformationScreen';
  final _firestore = FirebaseFirestore.instance;
  final _user = auth.FirebaseAuth.instance.currentUser;

  /// Checks if the user is not part of any community.
  Future<bool> _getUserHasNoCommuniy() async {
    final userSnapshot =
        await _firestore.collection(fs.Collection.users).doc(_user.uid).get();
    var communities = userSnapshot.data()[fs.User.communities];
    return communities?.isEmpty ?? true;
  }

  /// Checks if the user has never seen the information.
  Future<bool> _getUserNeverSeenInfo() async {
    final SharedPreferences prefs = await _prefs;
    return !(prefs.getBool(_showOnceIdentifier) ?? false);
  }

  /// Saves that the user has seen the information.
  Future<void> _setSeenInfoBefore() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(_showOnceIdentifier, true);
  }

  /// Pushes setup screens in order.
  Future<void> _pushScreens(BuildContext ctx) async {
    //* This pattern (using a FutureBuilder) will break if the first future it
    //* is waiting for is a push. It will violate an assertion
    //* "'!navigator._debugLocked': is not true."
    //* This assertion is used to "prevent re-entrant calls to push, pop, and
    //* friends". This most likely happens because the FutureBuilder is pushing
    //* a screen at the same time as this method (the future).
    //* The problem is solved by first awaiting null. This will have dart
    //* schedule the following call to push as soon as possible once the current
    //* call stack returns to the event loop. (Kal-Elx)
    //* Source: https://stackoverflow.com/questions/55618717/error-thrown-on-navigator-pop-until-debuglocked-is-not-true
    await null; //! Do not remove this.

    bool pushedScreen = false;

    // Push screen for adding community if the user is not part of one.
    if (await _getUserHasNoCommuniy()) {
      await Navigator.of(ctx).pushNamed(AddCommunityScreen.routeName);
      pushedScreen = true;
    }

    // Push information screen if the user has not seen it before.
    if (await _getUserNeverSeenInfo()) {
      await Navigator.of(ctx).pushNamed(InformationScreen.routeName);
      _setSeenInfoBefore();
      pushedScreen = true;
    }

    if (pushedScreen) {
      // Wait for pop animation to finish.
      await Future.delayed(Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _pushScreens(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TabScreen();
        } else {
          return Scaffold();
        }
      },
    );
  }
}

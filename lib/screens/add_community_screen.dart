import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../design/my_colors.dart';
import '../lang/my_localizations.dart';
import '../widgets/setup/continue_button.dart';
import '../widgets/setup/code_input.dart';
import '../utils/firestore_values.dart' as fs;

class AddCommunityScreen extends StatefulWidget {
  static const routeName = '/add-community';

  @override
  _AddCommunityScreenState createState() => _AddCommunityScreenState();
}

class _AddCommunityScreenState extends State<AddCommunityScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _user = auth.FirebaseAuth.instance.currentUser;
  var _submittedCode = false; // Controls if continue button is displayed.
  var _foundCommunity = false; // Given community code exists.
  var _communityCode = ''; // Code to found community;
  var _communityName = ''; // Name of community with given code.

  /// Tries to find a community with the given code and updates the state based
  /// on the result.
  Future<void> _findCommunity(String code) async {
    final communitySnapshot =
        await _firestore.collection(fs.Collection.communities).doc(code).get();
    setState(() {
      _submittedCode = true;
      _foundCommunity = communitySnapshot.exists;
      if (_foundCommunity) {
        _communityCode = code;
        _communityName = communitySnapshot.data()![fs.Communities.name];
      }
    });
  }

  /// Adds the found community to the signed in user.
  Future<void> _joinFoundCommunity() async {
    _firestore.collection(fs.Collection.users).doc(_user!.uid).update({
      fs.User.communities: FieldValue.arrayUnion([_communityCode])
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      //* Prevents resizing when keyboard is opened.
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        //* Should not be able to pop using back button on Android.
        onWillPop: () async => false,
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            children: [
              const Spacer(flex: 1),
              Text(
                l10n.addCommunityInstruction,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 36.0),
              CodeInput(
                onComplete: (code) async {
                  FocusScope.of(context).unfocus(); // Close keyboard.
                  try {
                    await _findCommunity(code);
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.firebaseError)),
                    );
                  }
                },
                onChanged: (code) {
                  if (_submittedCode && code.length != 4) {
                    setState(() {
                      _submittedCode = false;
                    });
                  }
                },
              ),
              const SizedBox(height: 24.0),
              AnimatedOpacity(
                opacity: _submittedCode && !_foundCommunity ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Text(
                  l10n.noCommunityFound,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: MyColors.errorRed,
                      ),
                ),
              ),
              const Spacer(flex: 1),
              AnimatedOpacity(
                opacity: _submittedCode && _foundCommunity ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: ContinueButton(
                  community: _communityName,
                  onPressed: () async {
                    try {
                      await _joinFoundCommunity();
                      Navigator.of(context).pop();
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.firebaseError)),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

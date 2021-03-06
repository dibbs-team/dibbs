import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/auth/login_button.dart';
import '../lang/my_localizations.dart';
import '../utils/auth_services.dart';
import '../utils/firestore_values.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _googleSignIn = GoogleSignIn();
  final _auth = auth.FirebaseAuth.instance;

  /// Signs in a user with Google.
  Future<void> _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final user = (await _auth.signInWithCredential(credential)).user;

    await _saveUser(user);
  }

  /// Saves user information to Firestore.
  Future<void> _saveUser(auth.User user) async {
    FirebaseFirestore.instance.collection(Collection.users).doc(user.uid).set(
      {
        Users.name: user.displayName,
        Users.email: user.email,
        Users.image: user.photoURL,
        Users.phone: user.phoneNumber,
      },
      SetOptions(merge: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginButton(
              authenticationService: AuthenticationService.GOOGLE,
              onLoginUser: () {
                _signInWithGoogle().catchError(
                  (e) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.authFailed)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

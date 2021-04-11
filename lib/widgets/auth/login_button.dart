import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';

import '../../lang/my_localizations.dart';
import '../../utils/auth_services.dart';

class LoginButton extends StatelessWidget {
  final Function onLoginUser;
  final AuthenticationService authenticationService;

  LoginButton({
    required this.onLoginUser,
    required this.authenticationService,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);
    switch (authenticationService) {
      case AuthenticationService.GOOGLE:
        return GoogleAuthButton(
          onPressed: onLoginUser as void Function(),
          text: l10n.signInButtonText('Google'),
        );
      default:
        return Container();
    }
  }
}

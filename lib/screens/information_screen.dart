import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../widgets/information/information_card.dart';
import '../lang/my_localizations.dart';

class InformationScreen extends StatelessWidget {
  static const routeName = '/information';

  final List<Widget> information = [
    InformationCard(),
    InformationCard(),
    InformationCard(),
    InformationCard(),
  ];
  final controller = PageController();
  final name = auth.FirebaseAuth.instance.currentUser.displayName;

  @override
  Widget build(BuildContext context) {
    //* Padding for the widget. It's not possible to wrap the whole body in this
    //* padding since that cuts of the PageView.
    const double bodyPadding = 36.0;
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      body: WillPopScope(
        //* Should not be able to pop using back button on Android.
        onWillPop: () async => false,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: bodyPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    l10n.informationWelcome(name).toUpperCase(),
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 18,
                    child: PageView(
                      controller: controller,
                      children: information
                          .map(
                            (infoCard) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: bodyPadding,
                              ),
                              child: infoCard,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  if (information.length > 1)
                    SmoothPageIndicator(
                      controller: controller, // PageController
                      count: information.length,
                      effect: SlideEffect(
                        activeDotColor: Colors.black,
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        spacing: 16.0,
                      ),
                    ),
                  const Spacer(flex: 1),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: bodyPadding),
                    child: Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          l10n.closeInformation.toUpperCase(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/book_list_ad_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/add_community_screen.dart';
import 'screens/information_screen.dart';
import 'screens/ad_detail_screen.dart';
import 'widgets/setup/setup_screen_flow.dart';
import 'lang/my_localizations.dart';
import 'design/app_theme.dart';
import 'lang/my_localizations_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => MyLocalizations.of(context).title,
      localizationsDelegates: [
        const MyLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English (default)
        const Locale('sv'), // Swedish
      ],
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          // Show loading screen while checking if user is signed in.
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }
          var signedIn = userSnapshot.hasData;
          return AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: signedIn ? SetupScreenFlow() : AuthScreen(),
          );
        },
      ),
      routes: {
        AddCommunityScreen.routeName: (ctx) => AddCommunityScreen(),
        InformationScreen.routeName: (ctx) => InformationScreen(),
        AdDetailScreen.routeName: (ctx) => AdDetailScreen(),
        BookListAdScreen.routeName: (ctx) => BookListAdScreen(),
      },
      theme: AppTheme().themedata,
    );
  }
}

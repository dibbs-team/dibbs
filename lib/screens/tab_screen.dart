import 'package:dibbs/screens/bookings_screen.dart';
import 'package:dibbs/screens/notifications_screen.dart';
import 'package:flutter/material.dart';

import 'feed_screen.dart';
import 'upload_ad_screen.dart';
import 'profile_screen.dart';
import '../lang/my_localizations.dart';
import '../design/my_attributes.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>(); //* For showing SnackBar.
  static const _uploadAdScreenIndex = 2;
  static const _bookingsScreenIndex = 3;
  static const _profileScreenIndex = 4;

  var _selectedIndex = 0;

  late List<Widget?> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = <Widget?>[
      //! Modifying this list requires you to update index variables.
      FeedScreen(onReturnFromAdDetail: (bool bookingSuccessful) {
        setState(() {
          _selectedIndex = _bookingsScreenIndex;
        });
      }),
      NotificationsScreen(),
      null, //* Instead of UploadAdScreen.
      BookingsScreen(),
      ProfileScreen(),
    ];
  }

  /// Switches tab.
  void _onItemTapped(int index) async {
    if (index == _uploadAdScreenIndex) {
      //* The result shows if the upload was successful.
      final result = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => UploadAdScreen()));

      //* Result is null when the user aborts the upload process.
      if (result != null) {
        if (result) {
          // The upload was successful.
          setState(() {
            _selectedIndex = _profileScreenIndex; // Move to profile screen.
          });
        } else {
          // Something went wrong while uploading the ad.
          final l10n = MyLocalizations.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.errorOccured)),
          );
        }
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      key: _scaffoldKey,
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: MyAttributes.borderRadiusTop,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: l10n.feedScreenTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: l10n.notificationsScreenTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: l10n.uploadScreenTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: l10n.bookingsScreenTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: l10n.profileScreenTitle,
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'feed_screen.dart';
import 'upload_ad_screen.dart';
import 'profile_screen.dart';
import '../lang/my_localizations.dart';
import '../utils/show_snackbar.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>(); //* For showing SnackBar.
  static const _uploadAdScreenIndex = 1;
  static const _profileScreenIndex = 2;
  var _selectedIndex = 0;

  static final List<Widget> _tabs = <Widget>[
    //! Modifying this list requires you to update index variables.
    FeedScreen(),
    null, //* Instead of UploadAdScreen.
    ProfileScreen(),
  ];

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
          // Something went wrong while uploading the product.
          final l10n = MyLocalizations.of(context);
          showSnackbar(key: _scaffoldKey, message: l10n.errorOccured);
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_day),
            label: l10n.feedScreenTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: l10n.uploadScreenTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: l10n.profileScreenTitle,
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

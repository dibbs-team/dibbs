import 'package:flutter/material.dart';

import 'feed_screen.dart';
import '../lang/my_localizations.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>(); //* For showing SnackBar.
  var _selectedIndex = 0;

  static final List<Widget> _tabs = <Widget>[
    FeedScreen(),
    Scaffold(), //* Instead of UploadProductScreen.
    Scaffold(), //* Instead of ProfileScreen()
  ];

  /// Switches tab.
  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
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

import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/appBar.dart';
import 'package:medic_pulse_doc/Helper/appDrawer.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:medic_pulse_doc/routes/navigatorRoutes.dart';
import 'package:medic_pulse_doc/routes/tabData.dart';
import 'package:medic_pulse_doc/services/authServices.dart';

User loggedInUser;

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  String dpUrl;
  String phno;
  String name;
  int selectedIndex = 0;

  TabItem _currentTab = TabItem.home;

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            setState(() {
              selectedIndex = 0;
            });
            _selectTab(TabItem.home);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: AppBarDB(_scaffoldKey),
        ),
        endDrawer: AppDrawer(context),
        backgroundColor: appBG,
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.chats),
            _buildOffstageNavigator(TabItem.appointments),
            _buildOffstageNavigator(TabItem.profile),
          ],
        ),
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: headDark,
            selectedItemBorderColor: docGreen,
            selectedItemBackgroundColor: Colors.white,
            selectedItemIconColor: docGreen,
            selectedItemLabelColor: docGreen,
          ),
          selectedIndex: selectedIndex,
          onSelectTab: (index) {
            setState(() {
              selectedIndex = index;
              _selectTab(TabItem.values[index]);
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.home_outlined,
              label: 'Home',
            ),
            FFNavigationBarItem(
              iconData: Icons.chat_bubble,
              label: 'Chat',
            ),
            FFNavigationBarItem(
              iconData: Icons.calendar_today_rounded,
              label: 'Appointments',
            ),
            FFNavigationBarItem(
              iconData: Icons.person,
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: NavigatorRoutes(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

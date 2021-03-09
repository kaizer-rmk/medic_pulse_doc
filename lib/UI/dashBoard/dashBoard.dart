import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/appBar.dart';
import 'package:medic_pulse_doc/Helper/appDrawer.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:medic_pulse_doc/routes/navigatorRoutes.dart';
import 'package:medic_pulse_doc/routes/tabData.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}


class _DashBoardState extends State<DashBoard> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  String dpUrl;
  String mail;
  String name;
  int selectedIndex;
  

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
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() {
    try{
      final user =  _auth.currentUser;
      if(user!=null){
        loggedInUser = user;
        dpUrl = loggedInUser.photoURL;
        mail = loggedInUser.email;
        name = loggedInUser.displayName;
      }
    }
    catch(e){
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
            selectedIndex=0;
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
      endDrawer: AppDrawer(context,dpUrl,mail,name),
      backgroundColor: appBG,
      body: Stack(
        children: <Widget>[
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.chats),
          _buildOffstageNavigator(TabItem.appointments),
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
            print(selectedIndex);
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
        ],
      ),
    ),
    );
  }
  Widget _buildOffstageNavigator(TabItem tabItem){
    return Offstage(
      offstage: _currentTab != tabItem,
      child: NavigatorRoutes(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/appBar.dart';
import 'package:medic_pulse_doc/Helper/appDrawer.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  String dpUrl;
  String mail;
  String name;
  int selectedIndex;

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
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppBarDB(_scaffoldKey),
      ),
      endDrawer: AppDrawer(context,dpUrl,mail,name),
      backgroundColor: appBG,
      body: Column(
        children: <Widget>[

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
    );
  }
}

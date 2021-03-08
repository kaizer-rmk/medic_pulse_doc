import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/appBar.dart';
import 'package:medic_pulse_doc/Helper/appDrawer.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        print(loggedInUser);
        dpUrl = loggedInUser.photoURL;
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
      endDrawer: AppDrawer(context,dpUrl),
      backgroundColor: appBG,
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}

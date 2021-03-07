import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/roundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medic_pulse_doc/UI/logIn/loginScreen.dart';
import 'package:medic_pulse_doc/services/authServices.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Container(
        child: Center(
          child: RoundedButton(logo: Icons.close,title: "Sign Out", colour: Colors.red,onPressed: (){
            AuthService().signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },),
        ),
      ),
    );
  }
}

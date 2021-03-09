import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:medic_pulse_doc/UI/logIn/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medic_pulse_doc/services/authServices.dart';

AppDrawer(BuildContext context, dpUrl, email, name) {
  String displayName = "Dr. " + name;
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: headDark,
          ),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.green, spreadRadius: 3)
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(dpUrl),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 34.0),
                  child: Text(
                    displayName,
                    style: TextStyle(
                      color: docGreen,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  email,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.green,
          ),
          title: Text(
            "Profile",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.payment,
            color: Colors.green,
          ),
          title: Text(
            "Payment History",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
        Divider(
          color: headDark,
        ),
        ListTile(
          leading: Icon(
            Icons.info,
            color: headDark,
          ),
          title: Text(
            "Help Information",
            style: TextStyle(
              color: headDark,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.contact_page,
            color: headDark,
          ),
          title: Text(
            "Contact Us",
            style: TextStyle(
              color: headDark,
            ),
          ),
        ),
        Divider(
          color: headDark,
        ),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.red,
          ),
          title: Text(
            "Sign Out",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onTap: (){
            AuthService().signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
        ),
      ],
    ),
  );
}

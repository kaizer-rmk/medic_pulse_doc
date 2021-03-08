import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';



AppDrawer (BuildContext context,dpUrl){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
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
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(dpUrl),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 34.0),
                      child: Text(
                        "Dr. Mukesh Kumar",
                        style: TextStyle(
                          color: docGreen,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      "mukesh.india9991@gmail.com",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/String.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medic_pulse_doc/Helper/appDrawer.dart';


class AppBarDB extends StatelessWidget {

  @override
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppBarDB(this.scaffoldKey);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      decoration: BoxDecoration(
        color: headDark,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.0)),
      ),
      child: SafeArea(
        child: Row(

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image(
                image: AssetImage(
                  'images/logoIn.png',
                ),
                height: 60.0,
                width: 60.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    appName,
                    style: TextStyle(
                      color: docGreen,
                      fontSize: 23,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    appTag,
                    style: appBarSubHeadStyle.copyWith(color: Colors.white,fontSize: 16.0),
                  ),
                )
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 35,
                color: docGreen,
              ),
              onPressed: () {
                scaffoldKey.currentState.openEndDrawer();
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

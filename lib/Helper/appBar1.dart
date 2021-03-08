import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/String.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';

class AppBar1 extends StatelessWidget {
  const AppBar1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
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
                height: 80.0,
                width: 80.0,
              ),
            ),
            Text(
              appName,
              style: TextStyle(
                color: docGreen,
                fontSize: 28,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

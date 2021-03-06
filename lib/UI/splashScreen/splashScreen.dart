import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/UI/logIn/loginScreen.dart';
import 'package:medic_pulse_doc/UI/dashBoard/dashBoard.dart';
import 'package:medic_pulse_doc/Helper/String.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:medic_pulse_doc/services/authServices.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final delay = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nav();
  }

  _nav() async {
    var _duration = Duration(seconds: delay);
    return (Timer(_duration, () => {navigationPage()}));
  }

  void navigationPage() async {
    final bool check = AuthService().isSignedIn;
    if (check) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: splashBGGradient),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Center(
                            child: Image(
                          image: AssetImage('images/logoIn.png'),
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width * 0.70,
                        )),
                      ),
                      Text(appName, style: splashHeadTextStyle),
                      Text(appTag, style: splashSubHeadTextStyle),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      verCode,
                      style: splashVersionTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      devInfo,
                      style: splashDevTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:medic_pulse_doc/Helper/String.dart';
import 'package:medic_pulse_doc/Helper/roundedButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medic_pulse_doc/UI/dashBoard/dashBoard.dart';
import 'package:medic_pulse_doc/UI/logIn/docData.dart';
import 'package:medic_pulse_doc/services/authServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBG,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Flexible(
                  child: Image(
                    image: AssetImage('images/logoIn.png'),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  appName,
                  style: splashHeadTextStyle,
                ),
                Text(
                  appTag,
                  style: textStyleSubHeadInfo,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 50),
                CarouselSlider(
                    items: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: SvgPicture.asset('assets/as1.svg'),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: SvgPicture.asset('assets/as2.svg'),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: SvgPicture.asset('assets/as3.svg'),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 300,
                      enableInfiniteScroll: true,
                      reverse: false,
                      scrollDirection: Axis.horizontal, //can be set to Axis.vertical
                      viewportFraction: 1.0,
                      initialPage: 0,
                      aspectRatio: 16/10,
                      autoPlay: true,
                    ),
                ),
                SizedBox(height: 20),
                RoundedButton(
                  onPressed: () {
                    AuthService().signInWithGoogle().then((user) => {
                      this.user = user,
                      db.collection('docInfo').doc(user.uid).get().then((data)=>{
                        data.exists? Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())): Navigator.push(context,MaterialPageRoute(builder: (context)=>DocData())),
                      }),
                    });
                  },
                  colour: Colors.deepOrange,
                  title: googleSignin,
                  logo: Icons.email,
                ),
                Text(
                  devInfo,
                  style: infoDevTextStyle,
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ));
  }
}

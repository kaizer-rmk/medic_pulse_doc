import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//
// Colors
//
final Color appBG = Color(0xFFD8E6FE);
//final Color appBG = Color(0xFFECF1FA);
final Color docGreen = Color(0xFF4AC4D0);
//final Color docGreen = Color(0xFF4AC4D0);
final Color docHeader = docGreen.withAlpha(70);
//final Color docHeader = Color(0xFFAEDFFF);
final Color headDark = Color(0xFF181461);
final Color gray = Color(0xFF979CAF);
final Color white = Colors.white;
final Color google = Color(0xFFFC5A39);
final Color phone = Color(0xFF26A7CF);
final Color buttonDefault = Color(0xFF2A2AC0);
//
// Color Gradients
//
final LinearGradient splashBGGradient = LinearGradient(
    colors: [Color(0xFF2A2AC0), Color(0xFF181461)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
//
//  Splash Screen Text style
//
final TextStyle appBarHeadStyle =
TextStyle(color: docGreen, fontSize: 40.0, fontWeight: FontWeight.bold,fontFamily: 'Roboto');
final TextStyle appDrawerTextStyle =
TextStyle(color: Colors.black54, fontSize: 24.0, fontWeight: FontWeight.bold,fontFamily: 'Roboto');
final TextStyle appDrawerSubTextStyle =
TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold,fontFamily: 'Roboto');
final TextStyle appBarSubHeadStyle =
TextStyle(color: headDark, fontSize: 20.0, fontWeight: FontWeight.w100,fontFamily: 'Roboto');
//
//  Splash Screen Text style
//
final TextStyle splashHeadTextStyle =
    TextStyle(color: docGreen, fontSize: 35.0, fontWeight: FontWeight.bold,fontFamily: 'Montserrat');

final TextStyle splashSubHeadTextStyle =
    TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: white,fontFamily: "Montserrat");
final TextStyle splashVersionTextStyle =
    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: white,fontFamily: "Roboto",fontStyle: FontStyle.italic);
final TextStyle splashDevTextStyle =
TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: white,fontFamily: "Roboto",fontStyle: FontStyle.italic);

//
// Info-Signup Screen Text style
//

final TextStyle infoScreenTextStyle =
TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: headDark,fontFamily: "Roboto");
final TextStyle textStyleSubHeadInfo =
TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: gray,fontFamily: "Montserrat");
final TextStyle textStyleButton =
TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: white,fontFamily: "Roboto");
final TextStyle textButton =
TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300, color:Colors.black,fontFamily: "Roboto");
final TextStyle textButtonLink =
TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300, color: Color(0xFF2A2AC0),fontFamily: "Roboto");
final TextStyle infoDevTextStyle =
TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: docGreen,fontFamily: "Roboto",fontStyle: FontStyle.italic);
final TextStyle inputFieldTextStyle =
TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: Colors.black,fontFamily: "Roboto",);
final TextStyle dialogHead =
TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black,fontFamily: "Roboto",);
final TextStyle dialogSubHead =
TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black54,fontFamily: "Roboto",);

//
// DashBoard
//

final TextStyle textStyleR200 =
TextStyle(fontSize: 16.0, fontWeight: FontWeight.w200, color: Colors.white,fontFamily: "Roboto",);

final TextStyle textStyleR300 =
TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300, color: Colors.white,fontFamily: "Roboto",);

final TextStyle textStyleR500 =
TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700, color: Colors.white,fontFamily: "Roboto",);

final TextStyle textStyleButtonR500 =
TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: white,fontFamily: "Roboto");


final TextStyle textStyleBlueR700 =
TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color:Color(0xFF181461),fontFamily: "Roboto",);

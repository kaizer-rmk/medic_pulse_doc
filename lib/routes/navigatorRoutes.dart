import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/UI/screens/homeScreen.dart';
import 'package:medic_pulse_doc/UI/screens/chatScreen.dart';
import 'package:medic_pulse_doc/UI/screens/appointmentScreen.dart';
import 'tabData.dart';

class TabNavigatorRoutes{
  static const String root = '/';
}

class NavigatorRoutes extends StatelessWidget {

  NavigatorRoutes({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings){
        switch(tabItem.index){
          case 0:
            {
              return MaterialPageRoute(builder: (context)=>HomeScreen());
            }
          case 1:
            {
              return MaterialPageRoute(builder: (context)=>ChatScreen());
            }
          case 2:
            {
              return MaterialPageRoute(builder: (context)=>AppointmentScreen());
            }
        }
        return MaterialPageRoute(builder: (context)=>AppointmentScreen());
      },
    );
  }
}

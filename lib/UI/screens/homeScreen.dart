import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBG,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HomeCard(),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: homeCardGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upcomming Appointments:",
              style: homeTitle,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Time: 11:00",
              style: cardTextinfo,
            ),
            Text(
              "Date: 12-04-2021",
              style: cardTextinfo,
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Patient Name: Ritick Saha",
              style: nameTextinfo,
            ),
            SizedBox(
              height: 12.0,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Attend Patient",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
              color: Colors.lightBlueAccent,
              splashColor: Colors.greenAccent,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "View All Appointments ->",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

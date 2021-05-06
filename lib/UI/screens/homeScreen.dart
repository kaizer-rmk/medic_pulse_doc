import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:medic_pulse_doc/UI/screens/appointmentScreen.dart';

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
              UpcommingAppointmentCard(),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Quick Links",
                style: homeTitle.copyWith(
                  color: Colors.black54,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        color: headDark,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: splashBGGradient,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "./images/priscription.png",
                                  height: 70,
                                  width: 65,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Generate Prescription",
                                  textAlign: TextAlign.center,
                                  style: homeTitle.copyWith(
                                    color: docGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        color: headDark,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: splashBGGradient,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.settings,
                                  color: Colors.orange,
                                  size: 70,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Manage Appointement",
                                  textAlign: TextAlign.center,
                                  style: homeTitle.copyWith(
                                    color: docGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Covid Update",
                          style: textStyleSubHeadInfo.copyWith(
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Newest update May 11",
                          style: cardTextinfo.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        "See details",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(18),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white54,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.orangeAccent,
                            size: 36,
                          ),
                          Text(
                            "34,51,643",
                            style: homeTitle.copyWith(color: Colors.orange),
                          ),
                          Text(
                            "Active Case",
                            style: cardTextinfo.copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.save,
                            color: Colors.green,
                            size: 36,
                          ),
                          Text(
                            "3,01,643",
                            style: homeTitle.copyWith(color: Colors.green),
                          ),
                          Text(
                            "Recovered",
                            style: cardTextinfo.copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.dangerous,
                            color: Colors.red,
                            size: 36,
                          ),
                          Text(
                            "3,346",
                            style: homeTitle.copyWith(color: Colors.red),
                          ),
                          Text(
                            "Death",
                            style: cardTextinfo.copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: homeCardGradient,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_add_rounded,
                      color: Colors.orange,
                      size: 40,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        "Get Prime Membership to reach more patient",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
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

class UpcommingAppointmentCard extends StatelessWidget {
  const UpcommingAppointmentCard({
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

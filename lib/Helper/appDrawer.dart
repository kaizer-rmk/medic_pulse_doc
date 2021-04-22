import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:medic_pulse_doc/UI/logIn/loginScreen.dart';
import 'package:medic_pulse_doc/modals/docModal.dart';
import 'package:medic_pulse_doc/services/authServices.dart';

AppDrawer(BuildContext context) {
  String displayName = "Dr. Mukesh";
  // String name = await AuthService().getDocData();
  return Drawer(
    child: drawer(displayName, context),
  );
}

ListView drawer(String displayName, BuildContext context) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: headDark,
        ),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final data = snapshot.data as DocModal;
                String name = data.name;
                String dpUrl = data.profilepic;
                return Padding(
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
                                blurRadius: 10,
                                color: Colors.green,
                                spreadRadius: 3)
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
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            color: docGreen,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error"),
                );
              } else {
                return CircularProgressIndicator();
              }
            }
            return CircularProgressIndicator();
          },
          future: AuthService().getDocData(),
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
        onTap: () {
          AuthService().signOut();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      ),
    ],
  );
}

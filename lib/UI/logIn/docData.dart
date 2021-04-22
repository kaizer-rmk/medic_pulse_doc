import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:medic_pulse_doc/Helper/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medic_pulse_doc/UI/dashBoard/dashBoard.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class DocData extends StatefulWidget {
  @override
  _DocDataState createState() => _DocDataState();
}

class _DocDataState extends State<DocData> {
  final _auth = FirebaseAuth.instance;

  TextEditingController _controller;

  final _formKey = GlobalKey<FormState>();

//https://firebasestorage.googleapis.com/v0/b/testsahajlc.appspot.com/o/DocImages%2Fdoc1.png?alt=media&token=downloadTokens

  List gender = ["Male", "Female", "Other"];
  List<int> male = [2, 3];
  List<int> female = [1, 4, 5, 6];
  String sex;
  String name;
  String phno;
  String clincAddress;
  String dob;
  String category;
  String address;
  String dis;
  DateTime joinAt;
  int regID;
  int numImg;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: sex,
          onChanged: (value) {
            setState(() {
              print(value);
              sex = value;
              if (sex == "Male") {
                numImg = 2 + Random().nextInt(4 - 2);
                print(numImg);
              } else {
                numImg = 2 + Random().nextInt(4 - 2);
                print(numImg);
              }
            });
          },
        ),
        Text(title)
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    var rng = new Random();
    regID = rng.nextInt(900000) + 100000;
    name = "Dr." + name;
    _controller = new TextEditingController(text: name);
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        name = loggedInUser.displayName;
      }
    } catch (e) {
      print(e);
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppBarDB(_scaffoldKey),
      ),
      backgroundColor: appBG,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                  "Fill Your Details",
                  style: TextStyle(
                    color: docGreen,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          enabled: false,
                          readOnly: true,
                          controller: _controller,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter text...';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            phno = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text("Gender:"),
                            addRadioButton(0, 'Male'),
                            addRadioButton(1, 'Female'),
                            addRadioButton(2, 'Others'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: "Clinic Address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter text...';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            clincAddress = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DateTimePicker(
                          initialValue: '',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          dateLabelText: 'Date of Birth',
                          onChanged: (val) {
                            dob = val;
                          },
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) {
                            dob = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Category",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter text...';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            category = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: "Address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter text...';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            address = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: "Discription",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter text...';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            dis = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: FloatingActionButton.extended(
                            label: Text("Getting Started"),
                            icon: Icon(Icons.arrow_forward),
                            backgroundColor: docGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.white)),
                            elevation: 7.0,
                            onPressed: () {
                              var joinAt = DateTime.now();
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                _firestore
                                    .collection('docInfo')
                                    .doc(loggedInUser.uid)
                                    .set({
                                  'address': address,
                                  'category': category,
                                  'clinicAddress': clincAddress,
                                  'dob': dob,
                                  'joinAt': joinAt,
                                  'name': name,
                                  'phno': int.parse(phno),
                                  'regID': regID,
                                  'sex': sex,
                                  'uid': loggedInUser.uid,
                                  'dis': dis,
                                  'profilepic':
                                      "https://firebasestorage.googleapis.com/v0/b/testsahajlc.appspot.com/o/DocImages%2Fdoc$numImg.png?alt=media&token=downloadTokens",
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard()));
                              }
                            },
                          ),
                        ),
                      ),
                    ],
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

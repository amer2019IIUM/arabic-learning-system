import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/pages/teachersPages/editTeacher.dart';
import 'package:siginsignup/pages/teachersPages/notification.dart';
import 'package:siginsignup/pages/teachersPages/teacherChat.dart';
import 'package:siginsignup/pages/teachersPages/teacherdrawer.dart';
import 'package:siginsignup/pages/teachersPages/timeSlots.dart';
import 'package:siginsignup/pages/welcome.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/DRAWER.dart';
import 'package:siginsignup/shared/bottombar.dart';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  List passId;
  TextStyle stle = GoogleFonts.openSans(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    passId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Wid().appbar("Your Profile"),
        drawer: TeacherDrawer().drawer(passId[1] + " " + passId[9], passId[14],
            passId[4], context, passId),
        body: StreamBuilder(
          stream: Firestore.instance
              .collection("teachers")
              .document(passId[14])
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Card(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Ink(
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                  ),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF4AC8EA),
                                    Color(0xFF4AC8EA),
                                  ]),
                                ),
                              ),
                              Ink(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 140),
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      color: Colors.white,
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color(0xFF4AC8EA),
                                                Color(0xFF4AC8EA),
                                                Colors.pink[200],
                                              ]),
                                        ),
                                        child: Center(
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                  snapshot.data["photo"],
                                                  width: 300,
                                                  height: 300,
                                                  fit: BoxFit.fill)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Color(0xFF4AC8EA),
                            ),
                            title: Text("Name", style: stle),
                            subtitle: Text(
                                snapshot.data["fname"]
                                        .toString()
                                        .toUpperCase() +
                                    " " +
                                    snapshot.data["lname"]
                                        .toString()
                                        .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic)),
                          ),
                          Divider(),
                          ListTile(
                            leading:
                                Icon(Icons.email, color: Color(0xFF4AC8EA)),
                            title: Text(
                              "E-Mail",
                              style: stle,
                            ),
                            subtitle: Text(snapshot.data["email"].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic)),
                          ),
                          Divider(),
                          ListTile(
                            leading:
                                Icon(Icons.padding, color: Color(0xFF4AC8EA)),
                            title: Text(
                              "Gender",
                              style: stle,
                            ),
                            subtitle: Text(snapshot.data["gender"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.location_city_outlined,
                                color: Color(0xFF4AC8EA)),
                            title: Text("Address", style: stle),
                            subtitle: Text(snapshot.data["address"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.description,
                                color: Color(0xFF4AC8EA)),
                            title: Text(
                              "Description",
                              style: stle,
                            ),
                            subtitle: Text(snapshot.data["desc"].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic)),
                          ),
                          Divider(),
                          Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: InkWell(
                              child: Container(
                                  width: 300,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4AC8EA),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: FlatButton(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditTeacher(),
                                              settings: RouteSettings(
                                                  arguments:
                                                      passId[14].toString())));
                                    },
                                  )),
                            ),
                          ),
                          Divider()
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
        bottomNavigationBar: BottomBar().bottomBarTeacher(
            context,
            passId,
            Colors.white70,
            Colors.white70,
            Colors.white70,
            Colors.white70,
            Color(0xFF4AC8EA),
            null,
            null,
            null,
            null,
            circle()));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}

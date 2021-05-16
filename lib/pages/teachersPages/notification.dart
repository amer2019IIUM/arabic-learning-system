import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/pages/teachersPages/teacherChat.dart';
import 'package:siginsignup/pages/teachersPages/teacherPage.dart';
import 'package:siginsignup/pages/teachersPages/teacherdrawer.dart';
import 'package:siginsignup/pages/teachersPages/timeSlots.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/bottombar.dart';

class Notify extends StatefulWidget {
  // String studentID;
  // String teacherID;
  // Notify(this.studentID, this.teacherID);
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  List passId;
  @override
  Widget build(BuildContext context) {
    passId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: Wid().appbar("Notification"),
        drawer: TeacherDrawer().drawer(passId[1] + " " + passId[9], passId[14],
            passId[4], context, passId),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream:
                Firestore.instance.collection('students_teachers').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot documentSnapshot) {
                  return passId[14] == documentSnapshot.data['emailTeacher']
                      ? documentSnapshot.data['approved'] == 'yes'
                          ? Container()
                          : Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        selectedColor,
                                        Colors.pink[200]
                                      ]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(3),
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListTile(
                                  trailing: Wrap(
                                    spacing: 12, // space between two icons
                                    children: <Widget>[
                                      RaisedButton(
                                        color: selectedColor,
                                        child: Text(
                                          'Accept'.toUpperCase(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Service().approveRequest(
                                            "${documentSnapshot.data['emailStudent']}${documentSnapshot.data['emailTeacher']}",
                                            "${documentSnapshot.data['emailStudent']}${documentSnapshot.data['emailTeacher']}",
                                          );
                                        },
                                      ),
                                      RaisedButton(
                                        color: Colors.pink[300],
                                        child: Text(
                                          'DENY',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Service().denyRequest(
                                              "${documentSnapshot.data['emailStudent']}${documentSnapshot.data['emailTeacher']}");
                                        },
                                      ),
                                    ],
                                  ),
                                  // leading: ConstrainedBox(
                                  //   constraints: BoxConstraints(
                                  //     minWidth: 44,
                                  //     minHeight: 44,
                                  //     maxWidth: 44,
                                  //     maxHeight: 44,
                                  //   ),
                                  //   child: Image.network(
                                  //     documentSnapshot.data['photo'],
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                  title: Text(
                                    documentSnapshot.data['emailStudent']
                                        .toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                      : Container();
                }).toList());
              }
            },
          ),
        ),
        bottomNavigationBar: BottomBar().bottomBarTeacher(
            context,
            passId,
            Colors.white70,
            Color(0xFF4AC8EA),
            Colors.white70,
            Colors.white70,
            Colors.white70,
            null,
            circle(),
            null,
            null,
            null));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}

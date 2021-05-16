import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/LearningMaterialPage.dart';
import 'package:siginsignup/pages/teachersPages/chatTeacherScreen.dart';
import 'package:siginsignup/pages/homepage.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/pages/teachersPages/teacherPage.dart';
import 'package:siginsignup/pages/teachersPages/teacherdrawer.dart';
import 'package:siginsignup/pages/teachersPages/timeSlots.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/bottombar.dart';

import '../PackagesPage.dart';
import 'notification.dart';

class ChatTeacher extends StatefulWidget {
  @override
  _ChatTeacherState createState() => _ChatTeacherState();
}

class _ChatTeacherState extends State<ChatTeacher> {
  List passId;
  String studentEmail;
  String teacherEmail;
  List<String> users;
  String currentTeacher;
  sendMessage() {
    String chatRoomId = "$studentEmail$teacherEmail";

    Map<String, dynamic> chatRoom = {
      "user": users,
      "chatRoomId": chatRoomId,
    };
    Service().addChatRoom(chatRoom, "$studentEmail$teacherEmail");
  }

  @override
  void initState() {
    super.initState();
    getCurrentTeacherEmail();
  }

  getCurrentTeacherEmail() async {
    currentTeacher = await HelperFunctions.getteacherEmail();
    print(currentTeacher);
  }

  @override
  Widget build(BuildContext context) {
    passId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: Wid().appbar("Chat"),
        drawer: TeacherDrawer().drawer(passId[1] + " " + passId[9], passId[14],
            passId[4], context, passId),
        body: Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('students_teachers')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot snapshot) {
                      studentEmail = snapshot.data['emailStudent'];
                      teacherEmail = snapshot.data['emailTeacher'];
                      users = [studentEmail, teacherEmail];
                      return currentTeacher == snapshot.data['emailTeacher']
                          ? snapshot.data['approved'] == 'yes'
                              ? Card(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.all(15),
                                    child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(70.0),
                                        child: Image.network(
                                            snapshot.data['studentPhoto'],
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.fill),
                                      ),
                                      trailing: Wrap(
                                        spacing: 12, // space between two icons
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () async {
                                              sendMessage();

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChatTeacherScreen(
                                                              "${snapshot.data['emailStudent']}${snapshot.data['emailTeacher']}",
                                                              "${snapshot.data['emailStudent']}${snapshot.data['emailTeacher']}",
                                                              "${snapshot.data['emailTeacher']}")));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 90,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color(0xFF4AC8EA),
                                                        Color(0xFF4AC8EA)
                                                      ])),
                                              child: Text(
                                                'Message',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
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
                                        snapshot.data['studentName'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                          : Container();
                    }).toList());
                  }
                })),
        bottomNavigationBar: BottomBar().bottomBarTeacher(
            context,
            passId,
            Colors.white70,
            Colors.white70,
            Color(0xFF4AC8EA),
            Colors.white70,
            Colors.white70,
            null,
            null,
            circle(),
            null,
            null));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}

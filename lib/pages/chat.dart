import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/Model/students.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/LearningMaterialPage.dart';
import 'package:siginsignup/pages/chatStudentRoom.dart';
import 'package:siginsignup/pages/homepage.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/DRAWER.dart';
import 'package:intl/intl.dart';
import 'package:siginsignup/shared/bottombar.dart';
import 'package:siginsignup/shared/loading.dart';
import 'package:siginsignup/shared/shareddialog.dart';
import 'package:siginsignup/stylingwidget.dart';

import 'PackagesPage.dart';

class Chat extends StatefulWidget {
  String studentID;
  Chat([this.studentID]);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  void showAlertDialogOnOkCallback(String title, String msg,
      DialogType dialogType, BuildContext context, VoidCallback onOkPress) {
    AwesomeDialog(
      context: context,
      animType: AnimType.TOPSLIDE,
      dialogType: dialogType,
      title: title,
      desc: msg,
      btnOkIcon: Icons.check_circle,
      btnOkColor: Colors.green.shade900,
      btnOkOnPress: onOkPress,
    ).show();
  }

  String studentEmail;
  String teacherEmail;
  List<String> users;
  int hasMintues;
  List datastudnets;
  List data;
  String id;
  String emailStud;
  List lst;
  String name;
  String photo;
  String studentsharedPre;
  getStudentData() async {
    emailStud = await HelperFunctions.getUserEmailSharedPreference();
    setState(() {});
    name = await HelperFunctions.getStudentName();
    photo = await HelperFunctions.getStudentphoto();
    studentsharedPre = await HelperFunctions.getstudentEmail();

    setState(() {
      name = name;
    });
    setState(() {
      photo = photo;
    });
    setState(() {
      studentsharedPre = studentsharedPre;
    });
    DocumentSnapshot snapshot = await StudentsMod().getStudentData(emailStud);
    lst = snapshot.data.values.toList();

    setState(() {
      datastudnets = lst;
    });

    DocumentSnapshot snapshot2 = await Service().hasMintues(datastudnets[6]);

    data = snapshot2.data.values.toList();

    setState(() {
      hasMintues = data.first;
    });
  }

  @override
  void initState() {
    getStudentData();
    super.initState();
    setState(() {
      datastudnets = lst;
    });

    super.initState();
  }

  sendMessage() {
    String chatRoomId = "$studentEmail$teacherEmail";

    Map<String, dynamic> chatRoom = {
      "user": users,
      "chatRoomId": chatRoomId,
    };
    Service().addChatRoom1(chatRoom, "$studentEmail$teacherEmail");
  }

  @override
  Widget build(BuildContext context) {
    if (datastudnets == null) {
      return Loading();
    }
    if (datastudnets == null &&
        data == null &&
        hasMintues > 0 &&
        hasMintues == null)
      return Scaffold(
          appBar: Wid().appbar("Chat"),
          drawer: DWidget().drawer(
              name, studentsharedPre, datastudnets[5], context, datastudnets),
          body: StylingWidgets()
              .info("You should be approved by ", "tutors", context),
          bottomNavigationBar: BottomBar().bottomBar(
              context,
              datastudnets,
              null,
              Colors.white70,
              Colors.white70,
              Colors.white70,
              Color(0xFF4AC8EA),
              Colors.white70,
              null,
              null,
              null,
              circle(),
              null));
    else {
      return Scaffold(
          appBar: Wid().appbar("Chat"),
          drawer: DWidget().drawer(datastudnets[0] + " " + datastudnets[2],
              datastudnets[6], datastudnets[5], context, datastudnets),
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
                          .map((DocumentSnapshot documentSnapshot) {
                    studentEmail = documentSnapshot.data['emailStudent'];
                    teacherEmail = documentSnapshot.data['emailTeacher'];
                    users = [studentEmail, teacherEmail];

                    return datastudnets[6] ==
                            documentSnapshot.data['emailStudent']
                        ? documentSnapshot.data['approved'] == 'yes'
                            ? Card(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(15),
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(70.0),
                                      child: Image.network(
                                          documentSnapshot.data['teacherPhoto'],
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.fill),
                                    ),
                                    trailing: Wrap(
                                      spacing: 12, // space between two icons
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () async {
                                            if (hasMintues > 0) {
                                              DateTime before = DateTime.now();
                                              DateTime after = DateTime.now();

                                              sendMessage();

                                              await HelperFunctions
                                                  .saveUserISINCHATSharedPreference(
                                                      true);
                                              await HelperFunctions.saveitRequest(
                                                  "${documentSnapshot.data['emailStudent']}${documentSnapshot.data['emailTeacher']}");
                                              await HelperFunctions.savechatRoomId(
                                                  "${documentSnapshot.data['emailStudent']}${documentSnapshot.data['emailTeacher']}");
                                              await HelperFunctions.savesendBy(
                                                  "${documentSnapshot.data['emailStudent']}");
                                              await HelperFunctions
                                                  .saveteacherEmail(
                                                      "${documentSnapshot.data['emailTeacher']}");
                                              await HelperFunctions
                                                  .savestudentEmail(
                                                      "${documentSnapshot.data['emailStudent']}");
                                              await HelperFunctions
                                                  .savestartMinutes(
                                                      before.toString());
                                              print(await HelperFunctions
                                                  .getteacherEmail());
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChatStudentScreen()));
                                            } else {
                                              SharedShowDialog().dialog2(
                                                  context,
                                                  "Sorry, you need to have to purchase a package!");
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 90,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      Color(0xFF4AC8EA),
                                                      Color(0xFF4AC8EA)
                                                    ])),
                                            child: Text(
                                              'Message',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
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
                                      documentSnapshot.data['teacherName']
                                          .toString(),
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
              },
            ),
          )
          // : SingleChildScrollView(
          //     physics: BouncingScrollPhysics(),
          //     child: Column(children: <Widget>[
          //       SizedBox(height: 60),

          //       //===========================
          //       //         Dialog 1
          //       //===========================
          //       AnimatedButton(
          //         text: 'Dialog 1',
          //         color: Colors.yellowAccent,
          //         pressEvent: () {
          //           showAlertDialogOnOkCallback(
          //               'Success !',
          //               'The operation was successfully completed.',
          //               DialogType.SUCCES,
          //               context,
          //               () => {});
          //         },
          //       ),

          //       //===========================
          //       //         Dialog 2
          //       //===========================
          //       AnimatedButton(
          //         text: 'Dialog 2',
          //         color: Colors.teal,
          //         pressEvent: () {
          //           AwesomeDialog(
          //                   context: context,
          //                   headerAnimationLoop: false,
          //                   dialogType: DialogType.INFO,
          //                   animType: AnimType.BOTTOMSLIDE,
          //                   title: 'Information',
          //                   desc: 'The operation was successfully completed.',
          //                   btnCancelOnPress: () {})
          //               .show();
          //         },
          //       ),

          //       //===========================
          //       //         Dialog 3
          //       //===========================
          //       AnimatedButton(
          //         text: 'Dialog 3',
          //         color: Colors.deepPurpleAccent,
          //         pressEvent: () {
          //           AwesomeDialog(
          //             context: context,
          //             headerAnimationLoop: false,
          //             dialogType: DialogType.INFO,
          //             animType: AnimType.BOTTOMSLIDE,
          //             title: 'Information',
          //             desc: 'The operation was successfully completed.',
          //           ).show();
          //         },
          //       ),

          //       //===========================
          //       //         Dialog 4
          //       //===========================
          //       AnimatedButton(
          //         text: 'Dialog 4',
          //         color: Colors.orange,
          //         pressEvent: () {
          //           AwesomeDialog(
          //                   context: context,
          //                   dialogType: DialogType.WARNING,
          //                   headerAnimationLoop: false,
          //                   animType: AnimType.TOPSLIDE,
          //                   title: 'Warning',
          //                   desc: 'Are you sure you want to delete the item',
          //                   btnCancelOnPress: () {},
          //                   btnOkOnPress: () {})
          //               .show();
          //         },
          //       ),

          //       //===========================
          //       //         Dialog 5
          //       //===========================
          //       AnimatedButton(
          //         text: 'Dialog 5',
          //         color: Colors.red,
          //         pressEvent: () {
          //           AwesomeDialog(
          //                   context: context,
          //                   dialogType: DialogType.ERROR,
          //                   animType: AnimType.RIGHSLIDE,
          //                   headerAnimationLoop: false,
          //                   title: 'Error',
          //                   desc: 'Are you sure you want to delete the item',
          //                   btnOkOnPress: () {},
          //                   btnOkColor: Colors.red)
          //               .show();
          //         },
          //       ),

          //       //===========================
          //       //         Dialog 6
          //       //===========================
          //       AnimatedButton(
          //         text: 'Dialog 6',
          //         color: Colors.green,
          //         pressEvent: () {
          //           AwesomeDialog(
          //               context: context,
          //               animType: AnimType.LEFTSLIDE,
          //               headerAnimationLoop: false,
          //               dialogType: DialogType.SUCCES,
          //               title: 'Succes',
          //               desc:
          //                   'The operation was successfully completed..................................',
          //               btnOkIcon: Icons.check_circle,
          //               onDissmissCallback: () {
          //                 debugPrint('Dialog Dissmiss from callback');
          //               }).show();
          //         },
          //       ),

          //       //===========================
          //       //         Dialog 7
          //       //===========================

          //       //===========================
          //       //         Dialog 8
          //       //===========================
          //       AnimatedButton(
          //         text: 'Dialog 8',
          //         color: Colors.brown,
          //         pressEvent: () {
          //           AwesomeDialog(
          //             context: context,
          //             animType: AnimType.SCALE,
          //             customHeader: Icon(
          //               Icons.face,
          //               size: 50,
          //             ),

          //             title: 'This is Custom Dialod',
          //             desc: 'Confirm or cancel the deletion process',
          //             btnOk: FlatButton(
          //               child: Text('Cancel Button'),
          //               onPressed: () {
          //                 Navigator.of(context).pop();
          //               },
          //             ),
          //             //this is ignored
          //             btnOkOnPress: () {},
          //           ).show();
          //         },
          //       ),

          //       SizedBox(height: 60),
          //     ])),
          ,
          bottomNavigationBar: BottomBar().bottomBar(
              context,
              datastudnets,
              datastudnets[6],
              Colors.white70,
              Colors.white70,
              Colors.white70,
              Color(0xFF4AC8EA),
              Colors.white70,
              null,
              null,
              null,
              circle(),
              null));
    }
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}

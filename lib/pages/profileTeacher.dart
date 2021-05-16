import 'dart:isolate';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/viewsch.dart';
import 'package:siginsignup/pages/viewteachermaterial.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/shareddialog.dart';

class TeacherProfile extends StatefulWidget {
  List studentID;
  String studentTeachID;
  List datastudnets;
  String teacherEmail;
  List teacher_student;
  List skills;
  TeacherProfile(this.studentTeachID, this.datastudnets, this.teacherEmail,
      this.teacher_student, this.skills);
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  QuerySnapshot infoEmail;
  List passId;
  DocumentSnapshot checking;
  String isRequest;

  @override
  void initState() {
    isRequest = widget.datastudnets.last + widget.teacherEmail;

    super.initState();
  }

  TextStyle stle = GoogleFonts.openSans(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    passId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Wid().appbar("Your Profile"),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("teachers")
            .document(passId[14])
            .snapshots(),
        builder: (context, snapshot) {
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
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                color: Colors.white,
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
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
                                        borderRadius: BorderRadius.circular(20),
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
                          snapshot.data["fname"].toString().toUpperCase() +
                              " " +
                              snapshot.data["lname"].toString().toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontStyle: FontStyle.italic)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: Color(0xFF4AC8EA)),
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
                      leading: Icon(Icons.padding, color: Color(0xFF4AC8EA)),
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
                      leading:
                          Icon(Icons.description, color: Color(0xFF4AC8EA)),
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

                    ListTile(
                      leading:
                          Icon(Icons.stars_rounded, color: Color(0xFF4AC8EA)),
                      title: Text("Top Skills", style: stle),
                      subtitle: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.blue[100], Colors.pink[100]]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Wrap(
                          spacing: 5,
                          children: [
                            snapshot.data["skills"][0] == null
                                ? SizedBox.shrink()
                                : FilterChip(
                                    label: Text(snapshot.data["skills"][0]),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    selected: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    backgroundColor: Colors.white,
                                    onSelected: (isSelected) {},
                                    selectedColor: Color(0xffeadffd),
                                  ),
                            snapshot.data["skills"][1] == null
                                ? SizedBox.shrink()
                                : FilterChip(
                                    label: Text(snapshot.data["skills"][1]),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    selected: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    backgroundColor: Colors.white,
                                    onSelected: (isSelected) {},
                                    selectedColor: Color(0xffeadffd),
                                  ),
                            snapshot.data["skills"][2] == null
                                ? SizedBox.shrink()
                                : FilterChip(
                                    label: Text(snapshot.data["skills"][2]),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    selected: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    backgroundColor: Colors.white,
                                    onSelected: (isSelected) {},
                                    selectedColor: Color(0xffeadffd),
                                  ),
                            snapshot.data["skills"][3] == null
                                ? SizedBox.shrink()
                                : FilterChip(
                                    label: Text(snapshot.data["skills"][3]),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    selected: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    backgroundColor: Colors.white,
                                    onSelected: (isSelected) {},
                                    selectedColor: Color(0xffeadffd),
                                  ),
                            snapshot.data["skills"][4] == null
                                ? SizedBox.shrink()
                                : FilterChip(
                                    label: Text(snapshot.data["skills"][4]),
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    selected: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    backgroundColor: Colors.white,
                                    onSelected: (isSelected) {},
                                    selectedColor: Color(0xffeadffd),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                        leading:
                            Icon(Icons.smart_button, color: Color(0xFF4AC8EA)),
                        title: Text(
                          "Qualifications",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            final request = await Permission.storage.request();
                            if (request.isGranted) {
                              final storagePath =
                                  await getExternalStorageDirectory();
                              await FlutterDownloader.enqueue(
                                  url: snapshot.data["cv"],
                                  savedDir: storagePath.path,
                                  fileName:
                                      "cv of Mr.${snapshot.data["fname"]}");
                            } else {
                              print('Not permssion');
                            }
                          },
                          icon: Icon(
                            Icons.download_outlined,
                            size: 35,
                            color: Colors.green,
                          ),
                        ),
                        subtitle: Text('')),
                    Divider(),
                    teachSchButtom(
                        context,
                        "'View Tutor Schedule'",
                        Icon(
                          Icons.schedule,
                        ),
                        openTutorsch),
                    SizedBox(
                      height: 10,
                    ),
                    teachSchButtom(context, "View Tutor Materials",
                        Icon(Icons.school), openTutormaterial),

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
                    // if ((widget.studentTeachID == isRequest))
                    requestButton()
                    //  Center(
                    //     child: FlatButton(
                    //       color: Colors.blue[300],
                    //       child: Text(
                    //         'Request a tutor',
                    //         style: TextStyle(
                    //             color: Colors.white, fontSize: 17.0),
                    //       ),
                    //       onPressed: () {
                    //         print('is ' + widget.studentTeachID);
                    //         Service()
                    //             .requestTutor(
                    //                 widget.datastudnets.last + passId[14],
                    //                 passId[14].toString(),
                    //                 widget.datastudnets.last.toString(),
                    //                 passId[1] + " " + passId[9],
                    //                 passId[4])
                    //             .then((value) =>
                    //                 print('create request ${passId[14]}'));
                    //         print(passId[1] + " " + passId[7]);
                    //       },
                    //     ),
                    //   )
                    // else
                    //   Center(
                    //     child: FlatButton(
                    //       color: Colors.green[300],
                    //       child: Text(
                    //         'pending',
                    //         style:
                    //             TextStyle(color: Colors.white, fontSize: 17.0),
                    //       ),
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    ,
                    Divider()
                  ],
                )
              ],
            ),
          ));
        },
      ),
    );
  }

  int progress = 0;
  ReceivePort receivePort = ReceivePort();
  // @override
  // void initState() {
  //   IsolateNameServer.registerPortWithName(
  //       receivePort.sendPort, "downloadingvideo");

  //   receivePort.listen((message) {
  //     setState(() {
  //       progress = message;
  //     });
  //   });
  //   getInfor();
  //   print(infoEmail);

  //   FlutterDownloader.registerCallback(downloadcall);
  //   super.initState();
  // }

  static downloadcall(id, status, progress) {
    SendPort sendPort;
    sendPort = IsolateNameServer.lookupPortByName("downloadingvideo");
    sendPort.send(progress);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget teachSchButtom(context, txt, icon, navigator) {
    return Container(
        height: 40,
        padding: EdgeInsets.only(left: 10),
        // margin: EdgeInsets.only(left: 70, right: 70),
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.pink[200],
              Colors.pink[200],
            ],
          ),
        ),
        child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  txt.toString().toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                ),
                SizedBox(
                  width: 5,
                ),
                icon
              ],
            ),
            onPressed: () {
              navigator();
            }));
  }

  openTutorsch() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ViewTutorSch(widget.teacherEmail)));
    print(widget.studentID);
  }

  openTutormaterial() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ViewTeacherMaterial(widget.teacherEmail)));
    print(widget.studentID);
  }

  Widget requestButton() {
    if (widget.teacher_student.first == "yes") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 40,
              width: MediaQuery.of(context).size.width * .29,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF4AC8EA),
                    Color(0xFF4AC8EA),
                  ],
                ),
              ),
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Chat'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Chat(widget.datastudnets[6])));
                },
              )),
        ],
      );
    } else if (isRequest == widget.teacher_student[3] ||
        isRequest == widget.teacher_student[4]) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_right, size: 40),
          Container(
              height: 40,
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue[200], Colors.blue[200]],
                ),
              ),
              child: FlatButton(
                child: Text(
                  'Already Requested'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                onPressed: () {
                  print(widget.teacher_student[3]);
                },
              )),
          Icon(Icons.arrow_left, size: 40),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_right, size: 40),
          Container(
              height: 40,
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [selectedColor, selectedColor],
                  )),
              child: FlatButton(
                child: Text(
                  'Request a tutor'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                onPressed: () async {
                  print('is ' + widget.studentTeachID);
                  // print(widget.datastudnets[0]);
                  await Service()
                      .requestTutor(
                          widget.datastudnets.last + passId[14],
                          passId[14].toString(),
                          widget.datastudnets.last.toString(),
                          passId[1] + " " + passId[9],
                          passId[4],
                          widget.datastudnets[5],
                          widget.datastudnets[0] + " " + widget.datastudnets[2])
                      .then((value) => print('create request ${passId[14]}'));
                  Navigator.pop(context);
                  SharedShowDialog().showdialogSuccessful1(
                      context, "Please For the approval");
                },
              )),
          Icon(Icons.arrow_left, size: 40),
        ],
      );
    }
  }
}

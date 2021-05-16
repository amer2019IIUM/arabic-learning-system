import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/pages/admin/sharedlessonswedges.dart';
import 'package:siginsignup/pages/teachersPages/teacherPage.dart';
import 'package:siginsignup/pages/teachersPages/teacherdrawer.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/bottombar.dart';
import 'package:siginsignup/shared/shareddialog.dart';

import '../../theme.dart';

class UploadMaterialByTeacher extends StatefulWidget {
  @override
  _UploadMaterialByTeacherState createState() =>
      _UploadMaterialByTeacherState();
}

class _UploadMaterialByTeacherState extends State<UploadMaterialByTeacher> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String doc;
  String _title;
  String _videoUrl;
  String loadingmaterial;
  String desc;
  List passId;

  @override
  Widget build(BuildContext context) {
    passId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: Wid().appbar("quran tajweed"),
        drawer: TeacherDrawer().drawer(passId[1] + " " + passId[9], passId[14],
            passId[4], context, passId),
        body: ListView(
          children: [
            LessonWidgets().headline("Upload Materials"),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Form(
              key: _globalKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "* Required";
                          }
                        },
                        onChanged: (value) {
                          _title = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "* Required";
                        }
                      },
                      onChanged: (value) {
                        desc = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: loadingmaterial != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Uploaded sucessfully.',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 15.5),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.download_outlined,
                                    color: selectedColor,
                                  ),
                                  iconSize: 30,
                                  // child: Text(
                                  //   'Upload',
                                  //   style: TextStyle(color: Colors.white),
                                  // ),
                                  onPressed: () async {
                                    await Permission.storage.request();
                                    var perm = await Permission.storage.status;
                                    if (perm.isGranted) {
                                      File file = await FilePicker.getFile(
                                          allowedExtensions: ['pdf', 'doc'],
                                          type: FileType.custom);

                                      var result = File(file.path);
                                      if (result != null) {
                                        var snapshot = await FirebaseStorage
                                            .instance
                                            .ref()
                                            .child('material/beginner/$_title')
                                            .putFile(file)
                                            .onComplete;
                                        doc =
                                            await snapshot.ref.getDownloadURL();
                                        loadingmaterial = doc;
                                      } else {
                                        print('It is null dude');
                                      }
                                    } else {
                                      print('Denied');
                                    }
                                  },
                                  color: Colors.green,
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Upload Materials',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 15.5),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.download_outlined,
                                    color: selectedColor,
                                  ),
                                  iconSize: 30,
                                  // child: Text(
                                  //   'Upload',
                                  //   style: TextStyle(color: Colors.white),
                                  // ),
                                  onPressed: () async {
                                    await Permission.storage.request();
                                    var perm = await Permission.storage.status;
                                    if (perm.isGranted) {
                                      File file = await FilePicker.getFile(
                                          allowedExtensions: ['pdf', 'doc'],
                                          type: FileType.custom);
                                      SharedShowDialog().showdialogSuccessful1(
                                          context, "Uploaded successfully");
                                      var result = File(file.path);
                                      if (result != null) {
                                        var snapshot = await FirebaseStorage
                                            .instance
                                            .ref()
                                            .child('material/beginner/$_title')
                                            .putFile(file)
                                            .onComplete;
                                        doc =
                                            await snapshot.ref.getDownloadURL();
                                      } else {
                                        print('It is null dude');
                                      }
                                    } else {
                                      print('Denied');
                                    }
                                  },
                                  color: Colors.green,
                                ),
                              ],
                            )),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_globalKey.currentState.validate()) {
                        if (doc != null) {
                          await Firestore.instance
                              .collection("teachersMaterials")
                              .document(_title)
                              .setData({
                            'title': _title,
                            'desc': desc,
                            'docUrl': doc,
                            'email': passId[14]
                          });

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UploadMaterialByTeacher(),
                                  settings: RouteSettings(arguments: passId)));
                          SharedShowDialog().showdialogSuccessful1(context,
                              "The lesson has been downloaded successfully.");
                        } else {
                          SharedShowDialog().dialog2(context,
                              "Please wait, the file not uploaded yet");
                        }
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        margin: EdgeInsets.symmetric(horizontal: 130),
                        decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          'Submit'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomBar().bottomBarTeacher(
            context,
            passId,
            Color(0xFF4AC8EA),
            Colors.white70,
            Colors.white70,
            Colors.white70,
            Colors.white70,
            circle(),
            null,
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

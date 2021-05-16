import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/shareddialog.dart';
import 'package:siginsignup/stylingwidget.dart';

class EditStudentInfo extends StatefulWidget {
  @override
  _EditStudentInfoState createState() => _EditStudentInfoState();
}

class _EditStudentInfoState extends State<EditStudentInfo> {
  String sname, fname, desc, country, headline;
  String gender = 'Male';
  String email;
  String mss = '';
  String textloadingphoto;
  String urlphoto;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String ref;
  int group = 1;
  @override
  Widget build(BuildContext context) {
    ref = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: Wid().appbar("edit your profile"),
      body: ListView(children: [
        SizedBox(
          height: 30,
        ),
        InkWell(
          child: StylingWidgets().uploadBtn("Edit your photo profile"),
          onTap: () async {
            await Permission.photos.request();
            var perm = await Permission.photos.status;

            if (perm.isGranted) {
              PickedFile pickedImage =
                  await ImagePicker().getImage(source: ImageSource.gallery);
              var result = File(pickedImage.path);
              if (result != null) {
                var snapshot = await FirebaseStorage.instance
                    .ref()
                    .child('students/profile/${ref}')
                    .putFile(result)
                    .onComplete;
                urlphoto = await snapshot.ref.getDownloadURL();
                setState(() {
                  textloadingphoto = urlphoto.toString();
                });
              } else if (result == null) {
                setState(() {
                  textloadingphoto = '';
                });
              } else {
                print('no image taken');
              }
            } else {
              print('denied');
            }
          },
        ),
        SizedBox(
          height: 15.0,
        ),
        Form(
          key: _formkey,
          child: Column(
            children: [
              StylingWidgets().formTextfield(
                Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      }
                    },
                    onChanged: (value) {
                      fname = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              StylingWidgets().formTextfield(
                Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      }
                    },
                    onChanged: (value) {
                      sname = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Second Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        StylingWidgets().formTextfield(Center(
            child: Container(
                child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 1,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  group = value;
                  gender = 'Male';
                });
              },
            ),
            Text(
              'Male',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            SizedBox(
              width: 60,
            ),
            Radio(
              value: 2,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  group = value;
                  gender = 'Female';
                });
              },
            ),
            Text(
              'Female',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
          ],
        )))),
        SizedBox(
          height: 15.0,
        ),
        Center(
          child: InkWell(
            child: Container(
                width: 350,
                height: 35,
                decoration: BoxDecoration(
                  color: Color(0xFF4AC8EA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FlatButton(
                  child: Text(
                    'Update'.toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  onPressed: () async {
                    try {
                      if (_formkey.currentState.validate()) {
                        await Firestore.instance
                            .collection('students')
                            .document(ref)
                            .updateData({
                          'fname': fname,
                          'lname': sname,
                          'gender': gender,
                        });
                        if (textloadingphoto != null &&
                            textloadingphoto != "") {
                          await Firestore.instance
                              .collection('students')
                              .document(ref)
                              .updateData({
                            'photo': textloadingphoto,
                          });
                        }

                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentProfile(),
                            ));
                        SharedShowDialog().showdialogSuccessful1(context,
                            "You have updated your Info successfully.");
                      }
                    } catch (e) {
                      print(e.toString() + 'error');
                    }
                  },
                )),
          ),
        ),
      ]),
    );
  }
}

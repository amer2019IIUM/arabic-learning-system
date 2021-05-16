import 'dart:io';

import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/Model/students.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/helper/authenticate.dart';
import 'package:siginsignup/pages/sign.dart';
import 'package:siginsignup/services/auth.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/DRAWER.dart';
import 'package:siginsignup/shared/Loading.dart';
import 'package:siginsignup/stylingwidget.dart';

class StudentReg extends StatefulWidget {
  final Function toggleView;
  StudentReg([this.toggleView]);
  @override
  _StudentRegState createState() => _StudentRegState();
}

class _StudentRegState extends State<StudentReg> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String fname;
  String lname;
  String email;
  String password;
  String gender = 'Male';
  String errorMessage = '';
  String male = 'Male';
  String female = 'Female';
  int group = 1;
  var urlphoto;
  String textloadingphoto;
  bool loading = false;
  var _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Loading();
    } else {
      return Scaffold(
        key: _scaffoldState,
        drawer: DWidget().drawerAuth("name", "email", "photo", context, []),
        body: Container(
          decoration: StylingWidgets().decoratedBox(),
          child: Form(
            key: _formkey,
            child: Container(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      height: MediaQuery.of(context).size.height * 1,
                      margin: EdgeInsets.only(top: 100),
                      child: ListView(
                        children: [
                          Image.asset(
                            "assets/customer-service.png",
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          StylingWidgets().headlinebig("CREATE ACCOUNT"),
                          Center(
                            child: Text(
                              errorMessage.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[300]),
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
                                  } else
                                    return null;
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
                                  } else
                                    return null;
                                },
                                onChanged: (value) {
                                  lname = value;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Last Name',
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
                                  } else
                                    return null;
                                },
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email',
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
                                obscureText: true,
                                obscuringCharacter: '*',
                                validator: (String value) {
                                  if (value.length < 6) {
                                    return "* Password should be at least 6 characters";
                                  } else if (value.isEmpty) {
                                    return "* Required";
                                  } else
                                    return null;
                                },
                                onChanged: (value) {
                                  password = value;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.vpn_key)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
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
                                    style: TextStyle(
                                        color: Colors.grey[700], fontSize: 16),
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
                                    style: TextStyle(
                                        color: Colors.grey[700], fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          SizedBox(
                            height: 15.0,
                          ),
                          InkWell(
                            child: StylingWidgets()
                                .uploadBtn("Upload your photo profile"),
                            onTap: () async {
                              await Permission.photos.request();
                              var perm = await Permission.photos.status;
                              if (perm.isGranted) {
                                PickedFile pickedImage = await ImagePicker()
                                    .getImage(source: ImageSource.gallery);
                                var result = File(pickedImage.path);
                                if (result != null) {
                                  var snapshot = await FirebaseStorage.instance
                                      .ref()
                                      .child('students/profile/$email')
                                      .putFile(result)
                                      .onComplete;

                                  urlphoto =
                                      await snapshot.ref.getDownloadURL();
                                  setState(() {
                                    textloadingphoto = urlphoto.toString();
                                  });
                                } else {}
                              } else {
                                print('denied');
                              }
                            },
                          ),
                          SizedBox(height: 20.0),
                          InkWell(
                            onTap: () async {
                              Auth().studentReg(_formkey, fname, lname, email,
                                  password, gender, textloadingphoto, context);
                              // print(
                              //     "$_formkey $fname $lname $email $password $gender $textloadingphoto");
                            },
                            child: StylingWidgets()
                                .signButton("Register".toUpperCase()),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('You have an account?'),
                              SizedBox(width: 2.0),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Authenticate(),
                                      ));
                                  widget.toggleView();
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: selectedColor),
                                ),
                              )
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                              onTap: () async {
                                await Auth().googleSignIn(context);
                              },
                              child: StylingWidgets()
                                  .googleBotton(context, "SIGN UP WITH GOOGLE"))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 30,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () => _scaffoldState.currentState.openDrawer(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}

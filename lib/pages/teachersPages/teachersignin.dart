import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/Model/entrysession.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/ChooseReg.dart';
import 'package:siginsignup/pages/homepage.dart';
import 'package:siginsignup/pages/signup.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/pages/teachersPages/teacherPage.dart';
import 'package:siginsignup/pages/teachersPages/teacherReg.dart';
import 'package:siginsignup/services/auth.dart';
import 'package:siginsignup/shared/DRAWER.dart';
import 'package:siginsignup/shared/shareddialog.dart';
import 'package:siginsignup/stylingwidget.dart';

class TeacherSign extends StatefulWidget {
  @override
  _TeacherSignState createState() => _TeacherSignState();
}

class _TeacherSignState extends State<TeacherSign> {
  DateTime current = new DateTime.now();
  String email;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var _scaffoldState = GlobalKey<ScaffoldState>();
  String password;
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: DWidget().drawerAuth("name", "email", "photo", context, []),
      resizeToAvoidBottomInset: false,
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
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          "assets/classroom.png",
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: GradientText(
                            text: "WELCOME BACK",
                            colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0,
                                color: selectedColor),
                          ),
                        ),
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
                              obscureText: false,
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
                                  hintText: "Email",
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.email)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        StylingWidgets().formTextfield(
                          Center(
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "* Required";
                                } else
                                  return null;
                              },
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.vpn_key)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        InkWell(
                          onTap: () async {
                            Auth().teacherSignIn(
                                _formkey, email, password, context);
                          },
                          child: StylingWidgets().signButton("LOGIN"),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Forgot password?',
                                style: GoogleFonts.aBeeZee()),
                            Text(' Reset',
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    color: selectedColor)),
                            SizedBox(width: 2.0),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: GoogleFonts.aBeeZee(),
                            ),
                            SizedBox(width: 2.0),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TeacherReg(),
                                    ));
                              },
                              child: Text('Register',
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.bold,
                                      color: selectedColor)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        SizedBox(
                          height: 20,
                        ),
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

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/Model/authStudent.dart';
import 'package:siginsignup/Model/entrysession.dart';
import 'package:siginsignup/Model/students.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/ChooseReg.dart';
import 'package:siginsignup/pages/homepage.dart';
import 'package:siginsignup/pages/signup.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/pages/studentReg.dart';
import 'package:siginsignup/services/auth.dart';
import 'package:siginsignup/shared/DRAWER.dart';
import 'package:siginsignup/shared/bezirt.dart';
import 'package:siginsignup/shared/loading.dart';
import 'package:siginsignup/stylingwidget.dart';

import '../theme.dart';

class Sign extends StatefulWidget {
  final toggleView;
  Sign([this.toggleView]);
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
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
                          height: 80,
                        ),
                        StylingWidgets().authLogo(),
                        StylingWidgets().headline("Happy to have you back"),
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
                            Auth().studentSignIn(
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
                                      builder: (context) => StudentReg(),
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
                        InkWell(
                            onTap: () async {
                              await Auth().googleSignIn(context);
                            },
                            child: StylingWidgets()
                                .googleBotton(context, "SIGN IN WITH GOOGLE"))
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

import 'package:flutter/material.dart';
import 'package:siginsignup/pages/sign.dart';
import 'package:siginsignup/pages/signup.dart';
import 'package:siginsignup/pages/studentReg.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Sign(toggleView);
    } else {
      return StudentReg(toggleView);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:siginsignup/Model/entrysession.dart';
import 'package:siginsignup/Model/students.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/sign.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/pages/teachersPages/teacherPage.dart';
import 'package:siginsignup/services/services.dart';

import 'package:siginsignup/shared/loading.dart';
import 'package:siginsignup/shared/shareddialog.dart';

class Auth {
  static String errorMessage;
  DateTime current = new DateTime.now();
  String email;
  static bool loading = false;
  List datat;
  String password;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  Future studentReg(_formkey, fname, lname, email1, password1, gender,
      textloadingphoto, context) async {
    if (_formkey.currentState.validate()) {
      try {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loading()));
        if (textloadingphoto != null) {
          AuthResult result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: email1, password: password1);

          StudentsMod().studnetsData(result.user.uid.toString(), fname, lname,
              email1, password1, gender, textloadingphoto);
          Service().createpackageVoiding(email1);
          if (textloadingphoto != null) {
            SharedShowDialog()
                .dialog2(context, "Please try to upload your photo again");
          }
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Sign(),
              ));
          if (result == null) {
            loading = false;
            Navigator.pop(
              context,
            );
          }
        } else {
          loading = false;
          Navigator.pop(
            context,
          );
          SharedShowDialog()
              .dialog2(context, "Please try to upload your photo again");
        }
      } catch (error) {
        switch (error.code) {
          case "ERROR_OPERATION_NOT_ALLOWED":
            errorMessage = "Your email address appears to be malformed.";
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(
                context, "Your email address appears to be malformed.");

            break;
          case "ERROR_WEAK_PASSWORD":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(context, "ERROR_WEAK_PASSWORD.");

            break;
          case "ERROR_INVALID_EMAIL":
            loading = false;
            Navigator.pop(
              context,
            );

            SharedShowDialog().dialog2(context, "Your email is invalid.");

            break;
          case "ERROR_EMAIL_ALREADY_IN_USE":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(
                context, "Email is already in use on different account.");

            break;
          case "ERROR_INVALID_CREDENTIAL":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(context, "Your email is invalid.");

            break;

          default:
            loading = false;
            Navigator.pop(
              context,
            );

            SharedShowDialog().dialog2(context, "An undefined Error happened.");
        }
      }

      if (errorMessage != null) {
        return Future.error(errorMessage);
      }
    } else {
      loading = false;

      SharedShowDialog().dialog2(context, "Not Validate.");
    }
  }

  Future studentSignIn(
    _formkey,
    email,
    password,
    context,
  ) async {
    if (_formkey.currentState.validate()) {
      try {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loading()));

        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        DocumentSnapshot passingData = await Firestore.instance
            .collection('students')
            .document(result.user.uid.toString())
            .get();
        datat = passingData.data.values.toList();
        EntrySession().entrySessionData(
            result.user.uid.toString(), current.toString(), email);
        await HelperFunctions.saveUserEmailSharedPreference(datat[1]);

        HelperFunctions.saveUserLoggedInSharedPreference(true);
        HelperFunctions.savestudentEmail(email);
        // HelperFunctions.saveDataStudentsSharedPreference(
        //     datat);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => StudentProfile(),
                settings: RouteSettings(arguments: datat)));
        if (result == null) {
          loading = false;
          Navigator.pop(
            context,
          );
        }
      } catch (error) {
        switch (error.code) {
          case "ERROR_INVALID_EMAIL":
            errorMessage = "Your email address appears to be malformed.";
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(
                context, "Your email address appears to be malformed.");

            break;
          case "ERROR_WRONG_PASSWORD":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(context, "Your password is wrong.");

            break;
          case "ERROR_USER_NOT_FOUND":
            loading = false;
            Navigator.pop(
              context,
            );

            SharedShowDialog()
                .dialog2(context, "User with this email doesn't exist.");

            break;
          case "ERROR_USER_DISABLED":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog()
                .dialog2(context, "User with this email has been disabled.");

            break;
          case "ERROR_TOO_MANY_REQUESTS":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog()
                .dialog2(context, "Too many requests. Try again later.");

            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(
                context, "Signing in with Email and Password is not enabled.");

            break;
          default:
            errorMessage = "An undefined Error happened.";

            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(context, "An undefined Error happened.");
        }
      }

      if (errorMessage != null) {
        return Future.error(errorMessage);
      }
    } else {
      print('Not Validate');
      loading = false;
      Navigator.pop(
        context,
      );
      SharedShowDialog().dialog2(context, "Not Validate.");
    }
  }

  Future signOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerTutors(
      String uid,
      String fname,
      String email,
      String password,
      String country,
      String photo,
      String tag,
      String desc,
      String cv,
      String gender,
      String adress,
      List skills) async {
    Firestore.instance.collection("teachers").document(email).setData({
      "uid": uid,
      "fname": fname,
      "lname": "",
      "email": email,
      "password": password,
      "icno": "pending",
      "country": country,
      "photo": photo,
      "headline": tag,
      "desc": desc,
      "qualify": "",
      "cv": cv,
      "gender": gender,
      "address": adress,
      "skills": skills,
      "countRate": "0.0",
      "stars": "0.0"
    });
  }

  Future teacherSignIn(
    _formkey,
    email,
    password,
    context,
  ) async {
    if (_formkey.currentState.validate()) {
      try {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loading()));

        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        DocumentSnapshot passingData = await Firestore.instance
            .collection('teachers')
            .document(result.user.email.toString())
            .get();
        datat = passingData.data.values.toList();

        HelperFunctions.saveteacherEmail(email);
        // HelperFunctions.saveDataStudentsSharedPreference(
        //     datat);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TeacherPage(),
                settings: RouteSettings(arguments: datat)));
        if (result == null) {
          loading = false;
          Navigator.pop(
            context,
          );
        }
      } catch (error) {
        switch (error.code) {
          case "ERROR_INVALID_EMAIL":
            errorMessage = "Your email address appears to be malformed.";
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(
                context, "Your email address appears to be malformed.");

            break;
          case "ERROR_WRONG_PASSWORD":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(context, "Your password is wrong.");

            break;
          case "ERROR_USER_NOT_FOUND":
            loading = false;
            Navigator.pop(
              context,
            );

            SharedShowDialog()
                .dialog2(context, "User with this email doesn't exist.");

            break;
          case "ERROR_USER_DISABLED":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog()
                .dialog2(context, "User with this email has been disabled.");

            break;
          case "ERROR_TOO_MANY_REQUESTS":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog()
                .dialog2(context, "Too many requests. Try again later.");

            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(
                context, "Signing in with Email and Password is not enabled.");

            break;
          default:
            errorMessage = "An undefined Error happened.";

            loading = false;
            Navigator.pop(
              context,
            );
            SharedShowDialog().dialog2(context, "An undefined Error happened.");
        }
      }

      if (errorMessage != null) {
        return Future.error(errorMessage);
      }
    } else {
      print('Not Validate');
      loading = false;
      Navigator.pop(
        context,
      );
      SharedShowDialog().dialog2(context, "Not Validate.");
    }
  }

  googleSignIn(context) async {
    try {
      await _googleSignIn.signIn();

      final snapshotcheckEmail = await Firestore.instance
          .collection("students")
          .document(_googleSignIn.currentUser.id)
          .get();
      if (snapshotcheckEmail == null || !snapshotcheckEmail.exists) {
        await StudentsMod().studnetsData(
            _googleSignIn.currentUser.id,
            _googleSignIn.currentUser.displayName,
            "",
            _googleSignIn.currentUser.email,
            "000",
            "",
            _googleSignIn.currentUser.photoUrl);
      } else {
        print("Already set the package");
      }

      DocumentSnapshot passingData = await Firestore.instance
          .collection('students')
          .document(_googleSignIn.currentUser.id)
          .get();
      datat = passingData.data.values.toList();

      await HelperFunctions.saveUserEmailSharedPreference(
          _googleSignIn.currentUser.id);
      await HelperFunctions.savestudentEmail(_googleSignIn.currentUser.email);

      HelperFunctions.saveUserLoggedInSharedPreference(true);

      final snapshot = await Firestore.instance
          .collection("packages")
          .document(_googleSignIn.currentUser.email)
          .get();
      if (snapshot == null || !snapshot.exists) {
        await Firestore.instance
            .collection("packages")
            .document(_googleSignIn.currentUser.email)
            .setData({"hasMintues": 0});
      } else {
        print("Already set the package");
      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => StudentProfile(),
              settings: RouteSettings(arguments: datat)));
    } catch (err) {
      SharedShowDialog().dialog2(context, err.toString());
      print(err);
    }
  }
}

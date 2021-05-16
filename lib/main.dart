import 'dart:io';
import 'dart:isolate';
import 'package:concentric_transition/concentric_transition.dart';

import 'dart:ui';
import 'dart:math';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:siginsignup/Model/teacherData.dart';
import 'package:siginsignup/admin.dart';
import 'package:siginsignup/helper/authenticate.dart';

import 'package:siginsignup/pages/ChooseReg.dart';
import 'package:siginsignup/pages/LearningMaterialPage.dart';
import 'package:siginsignup/pages/PackagesPage.dart';
import 'package:siginsignup/pages/admin/quran.dart';
import 'package:siginsignup/pages/admin/chooseMaterial.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/chatStudentRoom.dart';
import 'package:siginsignup/pages/teachersPages/chatTeacherScreen.dart';
import 'package:siginsignup/pages/chooselogin.dart';
import 'package:siginsignup/pages/editProfile.dart';

import 'package:siginsignup/pages/homepage.dart';
import 'package:siginsignup/pages/profileTeacher.dart';
import 'package:siginsignup/pages/sign.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:siginsignup/pages/signin.dart';
import 'package:siginsignup/pages/studentProfile.dart';

import 'package:siginsignup/pages/studentReg.dart';
import 'package:siginsignup/pages/teachersPages/teacherPage.dart';
import 'package:siginsignup/pages/teachersPages/teacherReg.dart';
import 'package:siginsignup/pages/teachersPages/timeSlots.dart';
import 'package:siginsignup/pages/teachersPages/teachersignin.dart';
import 'package:siginsignup/pages/uploading.dart';
import 'package:siginsignup/pages/videos.dart';
import 'package:siginsignup/pages/viewMaterialBeginner.dart';
import 'package:siginsignup/pages/viewsch.dart';

import 'package:flutter/material.dart';
import 'package:siginsignup/pages/welcome.dart';
import 'package:siginsignup/peref.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/googlesign.dart';
import 'package:siginsignup/splash_screen.dart';
import 'package:toast/toast.dart';

import 'call/index.dart';
import 'helper/helperFunctions.dart';
import 'pages/admin/Adminnotification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;
  bool userISINCHATIn;
  int amer = 1;
  @override
  void initState() {
    getLoggedInState();
    getISINCHATState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  getISINCHATState() async {
    await HelperFunctions.getUserISINCHATSharedPreference().then((value) {
      setState(() {
        userISINCHATIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userISINCHATIn == true) {
      return MaterialApp(
          debugShowCheckedModeBanner: false, home: ChatStudentScreen());
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: userIsLoggedIn != null
            ? userIsLoggedIn
                ? StudentProfile()
                : Authenticate()
            : Container(
                child: Center(
                  child: Authenticate(),
                ),
              ));
    // return MaterialApp(
    //     debugShowCheckedModeBanner: false, home: StudentProfile());
  }
}

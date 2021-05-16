import 'package:flutter/material.dart';
import 'package:pdf/widgets/widget.dart';
import 'package:siginsignup/pages/LearningMaterialPage.dart';
import 'package:siginsignup/pages/PackagesPage.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/homepage.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/pages/teachersPages/notification.dart';
import 'package:siginsignup/pages/teachersPages/teacherChat.dart';
import 'package:siginsignup/pages/teachersPages/teacherPage.dart';
import 'package:siginsignup/pages/teachersPages/teachermaterial.dart';
import 'package:siginsignup/pages/teachersPages/timeSlots.dart';

class BottomBar {
  fun1(context, datastudnets, emailstudent) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PackagesPage(emailstudent),
            settings: RouteSettings(arguments: datastudnets)));
  }

  fun2(context, datastudnets) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(),
            settings: RouteSettings(arguments: datastudnets)));
  }

  fun3(context, datastudnets) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LearingMaterialPage(),
            settings: RouteSettings(arguments: datastudnets)));
  }

  fun4(context, datastudnets, emailstudent) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Chat(emailstudent),
            settings: RouteSettings(arguments: datastudnets)));
  }

  fun5(context, datastudnets) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => StudentProfile(),
            settings: RouteSettings(arguments: datastudnets)));
  }

  dynamic bottomBar(context, datastudnets, emailstudent, color1, color2, color3,
      color4, color5, circle1, circle2, circle3, circle4, circle5) {
    Color color = Colors.blue[300];

    return BottomAppBar(
      color: Color(0xFF272D34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: circle1,
            child: IconButton(
              tooltip: "Choose your plan subscribe",
              highlightColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                fun1(context, datastudnets, emailstudent);
              },
              icon: Icon(
                Icons.card_giftcard_rounded,
                size: 23,
                color: color1,
              ),
            ),
          ),
          Container(
            decoration: circle2,
            child: IconButton(
              tooltip: "Search for a tutor",
              splashColor: Colors.white,
              onPressed: () {
                fun2(context, datastudnets);
              },
              icon: Icon(Icons.search, size: 25, color: color2),
            ),
          ),
          Container(
            decoration: circle3,
            child: IconButton(
              tooltip: "Lessons",
              highlightColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                fun3(context, datastudnets);
              },
              icon: Icon(
                Icons.school,
                size: 23,
                color: color3,
              ),
            ),
          ),
          Container(
            decoration: circle4,
            child: IconButton(
              tooltip: "Chat",
              highlightColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                fun4(context, datastudnets, emailstudent);
              },
              icon: Icon(
                Icons.chat,
                size: 23,
                color: color4,
              ),
            ),
          ),
          Container(
            decoration: circle5,
            child: IconButton(
              tooltip: "Your profile",
              highlightColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                fun5(context, datastudnets);
              },
              icon: Icon(
                Icons.person,
                size: 23,
                color: color5,
              ),
            ),
          ),
        ],
      ),
    );
  }
  ///////////////////////////////////
  //

  fun00(context, passId) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => UploadMaterialByTeacher(),
            settings: RouteSettings(arguments: passId)));
  }

  fun11(context, passId) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Notify(),
            settings: RouteSettings(arguments: passId)));
  }

  fun22(context, passId) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ChatTeacher(),
            settings: RouteSettings(arguments: passId)));
  }

  fun33(context, passId) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SlotTime(),
            settings: RouteSettings(arguments: passId)));
  }

  fun44(
    context,
    passId,
  ) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => TeacherPage(),
            settings: RouteSettings(arguments: passId)));
  }

  dynamic bottomBarTeacher(context, passId, color0, color1, color2, color3,
      color4, circle0, circle1, circle2, circle3, circle4) {
    Color color = Colors.blue[300];

    return BottomAppBar(
      color: Color(0xFF272D34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: circle0,
            child: IconButton(
              tooltip: "Upload Materials",
              highlightColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                fun00(context, passId);
              },
              icon: Icon(
                Icons.school,
                size: 23,
                color: color0,
              ),
            ),
          ),
          Container(
            decoration: circle1,
            child: IconButton(
              tooltip: "Notifcation",
              highlightColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                fun11(context, passId);
              },
              icon: Icon(
                Icons.notifications,
                size: 23,
                color: color1,
              ),
            ),
          ),
          Container(
            decoration: circle2,
            child: IconButton(
              tooltip: "Chat",
              splashColor: Colors.white,
              onPressed: () {
                fun22(context, passId);
              },
              icon: Icon(Icons.chat, size: 25, color: color2),
            ),
          ),
          Container(
            decoration: circle3,
            child: IconButton(
              tooltip: "Set your time",
              highlightColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                fun33(context, passId);
              },
              icon: Icon(
                Icons.schedule,
                size: 23,
                color: color3,
              ),
            ),
          ),
          Container(
            decoration: circle4,
            child: IconButton(
              tooltip: "Your profile",
              highlightColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                fun44(
                  context,
                  passId,
                );
              },
              icon: Icon(
                Icons.person,
                size: 23,
                color: color4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

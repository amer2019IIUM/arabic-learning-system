import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/Model/authStudent.dart';
import 'package:siginsignup/helper/authenticate.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/teachersPages/teacherChat.dart';
import 'package:siginsignup/pages/teachersPages/teacherPage.dart';
import 'package:siginsignup/pages/teachersPages/teachermaterial.dart';
import 'package:siginsignup/pages/teachersPages/teachersignin.dart';
import 'package:siginsignup/pages/teachersPages/timeSlots.dart';

import '../LearningMaterialPage.dart';
import '../homepage.dart';
import 'notification.dart';
import '../studentProfile.dart';

class TeacherDrawer {
  List<Color> colors = [
    Color(0xFF4AC8EA),
    Color(0xFF4AC8EA),
  ];
  Color iconColor = Colors.pink[200];
  Widget drawer(
    String name,
    String email,
    String photo,
    context,
    List lst,
  ) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF272D34)),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)])),
              accountName: Text(
                name,
                style: GoogleFonts.tauri(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
              ),
              accountEmail: Text(
                email,
                style: GoogleFonts.tauri(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.white),
              ),
              currentAccountPicture: Center(
                child: ClipOval(
                  child: Image.network(
                    photo,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: iconColor,
                size: 40,
              ),
              title: Container(
                height: 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF4AC8EA),
                          Color(0xFF4AC8EA),
                        ])),
                child: Text(
                  "Profile",
                  style: GoogleFonts.tauri(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherPage(),
                        settings: RouteSettings(arguments: lst)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.schedule,
                color: iconColor,
                size: 40,
              ),
              title: Container(
                height: 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: colors)),
                child: Text(
                  "Time availability",
                  style: GoogleFonts.tauri(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SlotTime(),
                        settings: RouteSettings(arguments: lst)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.chat,
                color: iconColor,
                size: 40,
              ),
              title: Container(
                height: 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: colors)),
                child: Text(
                  "Chat",
                  style: GoogleFonts.tauri(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatTeacher(),
                        settings: RouteSettings(arguments: lst)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: iconColor,
                size: 40,
              ),
              title: Container(
                height: 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: colors)),
                child: Text(
                  "Notifcations",
                  style: GoogleFonts.tauri(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadMaterialByTeacher(),
                        settings: RouteSettings(arguments: lst)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.school,
                color: iconColor,
                size: 40,
              ),
              title: Container(
                height: 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: colors)),
                child: Text(
                  "Upload Materials",
                  style: GoogleFonts.tauri(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatTeacher(),
                        settings: RouteSettings(arguments: lst)));
              },
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                AuthStudent().signout();

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (contex) => TeacherSign()));
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.only(left: 90, right: 90),
                padding: EdgeInsets.only(left: 2, right: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [iconColor, iconColor])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        child: Text(
                      "Logout",
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.white),
                    )),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(Icons.logout, color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

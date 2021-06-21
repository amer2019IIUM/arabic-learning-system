import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/Model/authStudent.dart';
import 'package:siginsignup/helper/authenticate.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/LearningMaterialPage.dart';
import 'package:siginsignup/pages/PackagesPage.dart';
import 'package:siginsignup/pages/homepage.dart';
import 'package:siginsignup/pages/sign.dart';
import 'package:siginsignup/pages/studentReg.dart';
import 'package:siginsignup/pages/teachersPages/notification.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/pages/teachersPages/teacherReg.dart';
import 'package:siginsignup/pages/teachersPages/teachersignin.dart';
import 'package:siginsignup/pages/teachersPages/teachersignin.dart';

class DWidget {
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
                        builder: (context) => StudentProfile(),
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
                  "Material",
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
                        builder: (context) => LearingMaterialPage(),
                        settings: RouteSettings(arguments: lst)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.search,
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
                  "Tutors",
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
                        builder: (context) => HomePage(),
                        settings: RouteSettings(arguments: lst)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.wallet_giftcard,
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
                  "Package",
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
                        builder: (context) => PackagesPage(email),
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
                HelperFunctions.saveUserLoggedInSharedPreference(false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (contex) => Authenticate()));
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

  Widget drawerAuth(
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
            SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.white,
              child: Text("Student's section",
                  style: GoogleFonts.robotoMono(
                      color: Colors.black, fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image.asset("assets/login.png"),
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
                  "Login",
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
                      builder: (context) => Authenticate(),
                    ));
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset("assets/signup.png"),
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
                  "Sign up",
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
                      builder: (context) => StudentReg(),
                    ));
              },
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.white,
              child: Text("Tutor's section",
                  style: GoogleFonts.robotoMono(
                      color: Colors.black, fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image.asset("assets/teachersign.png"),
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
                  "Login",
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
                      builder: (context) => TeacherSign(),
                    ));
              },
            ),
            Divider(),
            ListTile(
              leading: Image.asset("assets/signup.png"),
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
                  "Sign up",
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
                      builder: (context) => TeacherReg(),
                    ));
              },
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget teacher(
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
                        builder: (context) => StudentProfile(),
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
                        builder: (context) => LearingMaterialPage(),
                        settings: RouteSettings(arguments: lst)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.search,
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
                        builder: (context) => HomePage(),
                        settings: RouteSettings(arguments: lst)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.wallet_giftcard,
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
                        builder: (context) => Notify(),
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
                HelperFunctions.saveUserLoggedInSharedPreference(false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (contex) => Authenticate()));
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

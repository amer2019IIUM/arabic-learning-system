import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/Model/students.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';

import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/LearningMaterialPage.dart';
import 'package:siginsignup/pages/PackagesPage.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/checkyourpackage.dart';
import 'package:siginsignup/pages/homepage.dart';
import 'package:siginsignup/pages/studentEdit.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/DRAWER.dart';
import 'package:siginsignup/shared/bottombar.dart';
import 'package:siginsignup/shared/loading.dart';

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  String studentImage;
  String id;
  var downloadUrl;
  List datastudnets;
  String emailStud;
  List lst;
  List<Color> colors = [Color(0xFF4AC8EA), Colors.pink[200]];

  @override
  void initState() {
    getStudentData();
    super.initState();
    setState(() {
      datastudnets = lst;
    });
  }

  getStudentData() async {
    emailStud = await HelperFunctions.getUserEmailSharedPreference();
    DocumentSnapshot snapshot = await StudentsMod().getStudentData(emailStud);
    lst = snapshot.data.values.toList();

    setState(() {
      datastudnets = lst;
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return datastudnets == null
        ? Loading()
        : Stack(
            children: [
              Scaffold(
                  appBar: Wid().appbar("Profile"),
                  drawer: DWidget().drawer(
                      datastudnets[0] + " " + datastudnets[2],
                      datastudnets[6],
                      datastudnets[5],
                      context,
                      datastudnets),
                  body: StreamBuilder(
                    stream:
                        Firestore.instance.collection("students").snapshots(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? Text(' ')
                          : ListView.builder(
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot student =
                                    snapshot.data.documents[index];
                                HelperFunctions.saveStudentName(
                                    student["fname"] + " " + student["lname"]);
                                HelperFunctions.saveStudentphoto(
                                    student["photo"]);
                                HelperFunctions.savestudentEmail(
                                    student["email"]);
                                return datastudnets[6] != student["email"]
                                    ? Container()
                                    : Center(
                                        child: Column(
                                        children: [
                                          _buildHeader(student["photo"]),
                                          _buildMainInfo(context, widthC,
                                              "${student["fname"]} ${student["lname"]}"),
                                          Container(
                                            child: _buildInfo(
                                                context,
                                                widthC,
                                                "${student["fname"]} ${student["lname"]}",
                                                student["email"],
                                                student["gender"]),
                                          ),
                                          submitButton("Your Teachers", "View"),
                                          Divider(),
                                          submitButton2(
                                            "Package Details",
                                            "View",
                                          ),
                                          Divider(),
                                        ],
                                      ));
                              });
                    },
                  ),
                  bottomNavigationBar: BottomBar().bottomBar(
                      context,
                      datastudnets,
                      datastudnets[6],
                      Colors.white70,
                      Colors.white70,
                      Colors.white70,
                      Colors.white70,
                      Color(0xFF4AC8EA),
                      null,
                      null,
                      null,
                      null,
                      circle())),
            ],
          );
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }

  uploadImage() async {
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await ImagePicker().getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot = await FirebaseStorage.instance
            .ref()
            .child('students/profile/${datastudnets[6]}')
            .putFile(file)
            .onComplete;

        downloadUrl = await snapshot.ref.getDownloadURL();
        print('Done');
        setState(() {
          studentImage = downloadUrl;
          datastudnets[5] = downloadUrl;
          Firestore()
              .collection('students')
              .document(datastudnets[6])
              .updateData({"photo": downloadUrl});
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }

  Widget _buildHeader(String photo) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            gradient:
                LinearGradient(colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)]),
          ),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 140),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Colors.white,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(colors: colors),
                  ),
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(photo,
                            width: 300, height: 300, fit: BoxFit.fill)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  TextStyle stle = GoogleFonts.openSans(
      fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
  Widget _buildMainInfo(BuildContext context, double width, name) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(name.toString().toUpperCase(),
              style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: Color(0xFF4AC8EA),
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('Student',
              style: GoogleFonts.adventPro(
                  color: Color(0xFF4AC8EA).withOpacity(0.5),
                  fontSize: 20,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context, double width, String name,
      String email, String gender) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person, color: Color(0xFF4AC8EA)),
                      title: Text("Name"),
                      subtitle: Text(name),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: Color(0xFF4AC8EA)),
                      title: Text("E-Mail"),
                      subtitle: Text(email),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(Icons.people, color: Color(0xFF4AC8EA)),
                      title: Text("Gender"),
                      subtitle: Text(gender),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: InkWell(
                        child: Container(
                            width: 300,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Color(0xFF4AC8EA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: FlatButton(
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditStudentInfo(),
                                        settings: RouteSettings(
                                            arguments: emailStud.toString())));
                              },
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget tutors(String name, String photo) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(70.0),
                        child: Image.network(photo,
                            width: 60, height: 60, fit: BoxFit.fill),
                      ),
                      title: Text(
                        "Name",
                        style: stle,
                      ),
                      subtitle: Text(name),
                    ),
                    Divider(),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.blue[300], Colors.pinkAccent],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget submitButton(String text1, text2) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.blue[50],
      width: MediaQuery.of(context).size.width * .92,
      height: 100,
      child: Column(
        children: [
          GradientText(
              text: text1,
              colors: [Colors.grey[700], Colors.grey[700]],
              style:
                  GoogleFonts.saira(fontSize: 21, fontWeight: FontWeight.bold)),
          Center(
            child: InkWell(
              child: Container(
                  width: 300,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xFF4AC8EA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                      child: Text(
                        text2,
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      onPressed: functionOFBUTTON1)),
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton2(String text1, text2) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.blue[50],
      width: MediaQuery.of(context).size.width * .92,
      height: 100,
      child: Column(
        children: [
          GradientText(
              text: text1,
              colors: [Colors.grey[700], Colors.grey[700]],
              style:
                  GoogleFonts.saira(fontSize: 21, fontWeight: FontWeight.bold)),
          Center(
            child: InkWell(
              child: Container(
                  width: 300,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xFF4AC8EA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                      child: Text(
                        text2,
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      onPressed: functionOFBUTTON2)),
            ),
          ),
        ],
      ),
    );
  }

  functionOFBUTTON1() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Chat(datastudnets[6])));
  }

  functionOFBUTTON2() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CheckURpackage(datastudnets[6])));
  }

  Widget drawer(String name, String email, String photo, context) {
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
                      colors: colors)),
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
                color: Colors.pinkAccent,
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
                        settings: RouteSettings(arguments: datastudnets)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.school,
                color: Colors.pinkAccent,
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
                        settings: RouteSettings(arguments: datastudnets)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.pinkAccent,
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
                        settings: RouteSettings(arguments: datastudnets)));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.wallet_giftcard,
                color: Colors.pinkAccent,
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
                        builder: (context) => PackagesPage(datastudnets[6]),
                        settings: RouteSettings(arguments: datastudnets)));
              },
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 90, right: 90),
              padding: EdgeInsets.only(left: 2, right: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.pinkAccent,
                        Colors.pinkAccent,
                        Colors.pinkAccent,
                        Colors.pinkAccent,
                        Colors.pinkAccent,
                        Colors.white
                      ])),
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
            )
          ],
        ),
      ),
    );
  }
}

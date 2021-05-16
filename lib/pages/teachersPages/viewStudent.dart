import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/Model/students.dart';

import 'package:siginsignup/helper/helperFunctions.dart';

import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/DRAWER.dart';

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
        ? Scaffold(
            body: Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ),
          )
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
                  stream: Firestore.instance
                      .collection("students")
                      .where("email", isEqualTo: "z@gmail.com")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Text('PLease Wait')
                        : ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot student =
                                  snapshot.data.documents[index];
                              return Center(
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
                                  Divider(),
                                ],
                              ));
                            });
                  },
                ),
              ),
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
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          Text(name.toString().toUpperCase(),
              style: GoogleFonts.openSans(
                  fontSize: 20,
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
                    ListTile(
                      leading: Icon(Icons.people, color: Color(0xFF4AC8EA)),
                      title: Text("Gender"),
                      subtitle: Text(gender),
                    ),
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
}

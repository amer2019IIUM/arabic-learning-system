import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/Model/students.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/profileTeacher.dart';
import 'package:siginsignup/pages/searchTutor.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/services/student.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/DRAWER.dart';
import 'package:siginsignup/shared/bottombar.dart';
import 'package:siginsignup/shared/loading.dart';

import 'LearningMaterialPage.dart';
import 'PackagesPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool menuShown = false;
  double appbarHeight = 80.0;
  double menuHeight = 0.0;
  Animation<double> openAnimation, closeAnimation;
  AnimationController openController, closeController;
  String emailStud;
  List lst;
  String totalRate;
  String count;
  String teacherEmail;
  List teacherData;
  var totalstars;
  List skills;
  DocumentSnapshot approvechecking;

  List teacher_student;
  @override
  getStudentData() async {
    emailStud = await HelperFunctions.getUserEmailSharedPreference();
    DocumentSnapshot snapshot = await StudentsMod().getStudentData(emailStud);
    lst = snapshot.data.values.toList();

    setState(() {
      datastudnets = lst;
    });
  }

  /// ---------------------------
  /// Inilizing Animation controllers and state .
  /// ---------------------------

  void initState() {
    super.initState();
    getStudentData();
    super.initState();
    setState(() {
      datastudnets = lst;
    });
    openController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    closeController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    openAnimation = Tween(begin: 0.0, end: 1.0).animate(openController)
      ..addListener(() {
        setState(() {
          menuHeight = openAnimation.value;
        });
      });
    closeAnimation = Tween(begin: 1.0, end: 0.0).animate(closeController)
      ..addListener(() {
        setState(() {
          menuHeight = closeAnimation.value;
        });
      });
  }

  /// ---------------------------
  /// Acts action click with controllers .
  /// ---------------------------

  _handleMenuPress() {
    setState(() {
      openController.reset();
      closeController.reset();
      menuShown = !menuShown;
      menuShown ? openController.forward() : closeController.forward();
    });
  }

  /// ---------------------------
  /// Closing all  controllers for memory leaks.
  /// ---------------------------
  @override
  void dispose() {
    openController.dispose();
    closeController.dispose();
    super.dispose();
  }

  List datastudnets;
  DocumentSnapshot passingData;
  DocumentSnapshot checking;
  String isRequest;
  List<Color> colors = [Color(0xFF4AC8EA), Colors.pink[200]];

  @override
  Widget build(BuildContext context) {
    return datastudnets == null
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)])),
              ),
              actions: [
                new IconButton(
                    icon: new Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TutorSearch(
                                    totalstars,
                                    teacherEmail,
                                    datastudnets,
                                    skills,
                                    datastudnets[6],
                                  )));
                    }),
                SizedBox(
                  width: 10,
                )
              ],
              title: Text(
                "Tutors".toUpperCase(),
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 21.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            drawer: DWidget().drawer(datastudnets[0] + " " + datastudnets[2],
                datastudnets[6], datastudnets[5], context, datastudnets),
            body: StreamBuilder(
                stream: Firestore.instance
                    .collection('teachers')
                    .where("icno", isEqualTo: "approved")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    padding: EdgeInsets.only(top: 30),
                    children: snapshot.data.documents.map((document) {
                      teacherEmail = document['email'];

                      count = document['countRate'].toString();
                      skills = document['skills'];

                      totalRate = document['stars'].toString();
                      totalstars = double.parse(totalRate.toString()) /
                          double.parse(count.toString());

                      return Column(
                        children: [
                          Container(
                            child: tileList(
                                document['photo'],
                                document['fname'] + " " + document['lname'],
                                totalstars.isNaN
                                    ? "New Talent"
                                    : totalstars.toStringAsFixed(1).toString(),
                                document['email'],
                                document['skills']),
                          ),
                          Divider()
                        ],
                      );
                    }).toList(),
                  );
                }),
            // body: Container(
            //   padding: EdgeInsets.only(
            //     top: 10,
            //     left: 0,
            //   ),
            //   height: 700,
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(20)),
            //   child: cards(),
            // ),
            bottomNavigationBar: BottomBar().bottomBar(
                context,
                datastudnets,
                datastudnets[6],
                Colors.white70,
                Color(0xFF4AC8EA),
                Colors.white70,
                Colors.white70,
                Colors.white70,
                null,
                circle(),
                null,
                null,
                null));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }

  Widget tileList(String photo, String name, String desc, email, List sk) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            print('sdf');
///////////////
            ////////////////////
            passingData = await Firestore.instance
                .collection('teachers')
                .document(email)
                .get();
            teacherData = passingData.data.values.toList();

            DocumentSnapshot checking = await Firestore.instance
                .collection('students_teachers')
                .document(datastudnets[6] + email)
                .get();
            setState(() {
              if (checking.exists) {
                teacher_student = checking.data.values.toList();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherProfile(
                            email, datastudnets, email, teacher_student, sk),
                        settings: RouteSettings(arguments: teacherData)));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherProfile(
                            email, datastudnets, email, teacherData, sk),
                        settings: RouteSettings(arguments: teacherData)));
              }
            });
            print("this is the values which is $teacher_student");

            print(datastudnets.last);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: colors)),
            width: MediaQuery.of(context).size.width * .95,
            child: Card(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: -5.0),
                      leading: ClipOval(
                        child: Image.network(
                          photo,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Wrap(
                      //   spacing: 12, // space between two icons
                      //   children: <Widget>[
                      //     Container(
                      //       alignment: Alignment.center,
                      //       width: 80,
                      //       height: 40,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(20),
                      //           gradient: LinearGradient(
                      //               begin: Alignment.centerLeft,
                      //               end: Alignment.centerRight,
                      //               colors: [Colors.blue[300], Colors.pinkAccent])),
                      //       child: Text(
                      //         'Message',
                      //         style: TextStyle(
                      //             color: Colors.white, fontWeight: FontWeight.bold),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      title: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          totalstars.isNaN
                              ? Container()
                              : Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.orange,
                                ),
                          Text(desc),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 15),
                    child: Container(
                      child: Text(
                          'I am a business man and help with Conversations skills i have expericen in skh k oihsf  '),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  checkingRequest(id) async {
    print("he is " + await HelperFunctions.getteacherEmail());
    DocumentSnapshot checking = await Firestore.instance
        .collection('students_teachers')
        .document(id)
        .get();
    setState(() {
      teacher_student = checking.data.values.toList();
    });
  }
}

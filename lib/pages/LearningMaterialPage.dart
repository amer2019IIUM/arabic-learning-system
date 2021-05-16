import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/Model/students.dart';
import 'package:siginsignup/const/bottombar.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/MaterialAdvanced.dart';
import 'package:siginsignup/pages/MaterialIntermediate.dart';
import 'package:siginsignup/pages/admin/speaking.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/lessons/grammar.dart';
import 'package:siginsignup/pages/lessons/quran.dart';
import 'package:siginsignup/pages/lessons/sarf.dart';
import 'package:siginsignup/pages/lessons/speaking.dart';
import 'package:siginsignup/pages/lessons/writing.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/pages/viewMaterialBeginner.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/DRAWER.dart';
import 'package:siginsignup/shared/bottombar.dart';
import 'package:siginsignup/shared/loading.dart';
import 'package:siginsignup/stylingwidget.dart';

import 'PackagesPage.dart';
import 'homepage.dart';

class LearingMaterialPage extends StatefulWidget {
  @override
  _LearingMaterialPageState createState() => _LearingMaterialPageState();
}

class _LearingMaterialPageState extends State<LearingMaterialPage> {
  List datastudnets;
  String emailStud;
  List lst;

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

  moveToQuran() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuranM()));
  }

  moveTospeaking() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => SpeakingM()));
  }

  moveTosarf() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => SarfM()));
  }

  moveTowritng() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => WritingM()));
  }

  moveTogrammar() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => GrammarM()));
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Color(0xFF4AC8EA), Colors.pink[200]];
    return datastudnets == null
        ? Loading()
        : Scaffold(
            appBar: Wid().appbar("Lessons"),
            drawer: DWidget().drawer(datastudnets[0] + " " + datastudnets[2],
                datastudnets[6], datastudnets[5], context, datastudnets),
            body: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                StylingWidgets()
                    .cards(context, moveToQuran, "Tajweed", "assets/quran.png"),
                SizedBox(
                  height: 15,
                ),
                StylingWidgets().cards(
                    context, moveTogrammar, "GRAmmar", "assets/grammar.png"),
                SizedBox(
                  height: 15,
                ),
                StylingWidgets()
                    .cards(context, moveTosarf, "sarf", "assets/sarf.png"),
                SizedBox(
                  height: 15,
                ),
                StylingWidgets().cards(
                    context, moveTospeaking, "speaking", "assets/speaking.png"),
                SizedBox(
                  height: 15,
                ),
                StylingWidgets().cards(
                    context, moveTowritng, "writing", "assets/writer.png"),
                SizedBox(
                  height: 15,
                ),
                // Center(
                //   child: Container(
                //     width: 300,
                //     height: 331,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           child: Column(children: [
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Center(
                //               child: Text(
                //                 'Beginner'.toUpperCase(),
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 20,
                //                     color: Colors.white),
                //               ),
                //             ),
                //             SizedBox(
                //               height: 6,
                //             ),
                //             Container(
                //               child: Image.asset(
                //                 'assets/beginner.jpg',
                //               ),
                //             )
                //           ]),
                //         ),
                //         Container(
                //           width: 100,
                //           height: 50,
                //           child: FlatButton(
                //             child: Text(
                //               'View',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 18.0),
                //             ),
                //             onPressed: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) => MaterialBegineer(),
                //                   ));
                //             },
                //           ),
                //           decoration: BoxDecoration(
                //               color: Colors.white.withOpacity(0.3),
                //               borderRadius: BorderRadius.circular(10)),
                //         ),
                //       ],
                //     ),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(40),
                //       gradient: LinearGradient(
                //           begin: Alignment.centerLeft,
                //           end: Alignment.centerRight,
                //           colors: colors),
                //       border: Border.all(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Center(
                //   child: Container(
                //     width: 300,
                //     height: 331,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           child: Column(children: [
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Center(
                //               child: Text(
                //                 'Intermidate'.toUpperCase(),
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 20,
                //                     color: Colors.white),
                //               ),
                //             ),
                //             SizedBox(
                //               height: 6,
                //             ),
                //             Container(
                //               child: Image.asset(
                //                 'assets/inter.jpg',
                //                 width: MediaQuery.of(context).size.width * 1,
                //                 height:
                //                     MediaQuery.of(context).size.height * .26,
                //                 fit: BoxFit.fill,
                //               ),
                //             )
                //           ]),
                //         ),
                //         Container(
                //           width: 100,
                //           height: 50,
                //           child: FlatButton(
                //             child: Text(
                //               'View',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 18.0),
                //             ),
                //             onPressed: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) => MaterialBegineer(),
                //                   ));
                //             },
                //           ),
                //           decoration: BoxDecoration(
                //               color: Colors.white.withOpacity(0.3),
                //               borderRadius: BorderRadius.circular(10)),
                //         ),
                //       ],
                //     ),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(40),
                //       gradient: LinearGradient(
                //           begin: Alignment.centerLeft,
                //           end: Alignment.centerRight,
                //           colors: colors),
                //       border: Border.all(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Center(
                //   child: Container(
                //     width: 300,
                //     height: 331,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           child: Column(children: [
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Center(
                //               child: Text(
                //                 'Advanced'.toUpperCase(),
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 20,
                //                     color: Colors.white),
                //               ),
                //             ),
                //             SizedBox(
                //               height: 6,
                //             ),
                //             Container(
                //               child: Image.asset(
                //                 'assets/advanced.jpg',
                //               ),
                //             )
                //           ]),
                //         ),
                //         Container(
                //           width: 100,
                //           height: 50,
                //           child: FlatButton(
                //             child: Text(
                //               'View',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 18.0),
                //             ),
                //             onPressed: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) => MaterialBegineer(),
                //                   ));
                //             },
                //           ),
                //           decoration: BoxDecoration(
                //               color: Colors.white.withOpacity(0.3),
                //               borderRadius: BorderRadius.circular(10)),
                //         ),
                //       ],
                //     ),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(40),
                //       gradient: LinearGradient(
                //           begin: Alignment.centerLeft,
                //           end: Alignment.centerRight,
                //           colors: colors),
                //       border: Border.all(),
                //     ),
                //   ),
                // ),
              ],
            ),
            bottomNavigationBar: BottomBar().bottomBar(
                context,
                datastudnets,
                datastudnets[6],
                Colors.white70,
                Colors.white70,
                Color(0xFF4AC8EA),
                Colors.white70,
                Colors.white70,
                null,
                null,
                circle(),
                null,
                null));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}

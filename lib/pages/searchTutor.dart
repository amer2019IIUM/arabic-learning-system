import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:siginsignup/Model/teacherData.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/profileTeacher.dart';
import 'package:siginsignup/shared/appbar.dart';

class TutorSearch extends StatefulWidget {
  var totalstars;
  String email;
  List datastudnets;
  List skills;
  String studentEmail;

  TutorSearch(this.totalstars, this.email, this.datastudnets, this.skills,
      this.studentEmail);

  @override
  _TutorSearchState createState() => new _TutorSearchState();
}

class _TutorSearchState extends State<TutorSearch> {
  var queryResultSet = [];
  var tempSearchStore = [];
  DocumentSnapshot passingData;
  List teacherData;
  List teacher_student;

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      TeacherData().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
          setState(() {
            tempSearchStore.add(queryResultSet[i]);
          });
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element["fname"].toLowerCase().contains(value.toLowerCase()) ==
            true) {
          if (element["fname"].toLowerCase().indexOf(value.toLowerCase()) ==
              0) {
            setState(() {
              tempSearchStore.add(element);
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: Wid().appbar("Search by name"),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) {
                initiateSearch(val);
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0))),
            ),
          ),
          SizedBox(height: 10.0),
          ListView(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              primary: false,
              shrinkWrap: true,
              children: tempSearchStore.map((element) {
                return buildResultCard(
                    element['photo'],
                    element['fname'] + " " + element['lname'],
                    [element['stars'], element['countRate']],
                    element['email'],
                    element['skills'],
                    context);
              }).toList())
        ]));
  }

  Widget buildResultCard(
      String photo, String name, List desc, email, List sk, context) {
    double rate = double.parse(desc[0]) / double.parse(desc[1]);
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
                .document(widget.studentEmail + email)
                .get();
            setState(() {
              if (checking.exists) {
                teacher_student = checking.data.values.toList();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherProfile(email,
                            widget.datastudnets, email, teacher_student, sk),
                        settings: RouteSettings(arguments: teacherData)));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeacherProfile(
                            email, widget.datastudnets, email, teacherData, sk),
                        settings: RouteSettings(arguments: teacherData)));
              }
            });
            print("this is the values which is $teacher_student");

            print(widget.datastudnets.last);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [selectedColor, Colors.pinkAccent])),
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
                          widget.totalstars.isNaN
                              ? Container()
                              : Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.orange,
                                ),
                          rate.isNaN
                              ? Text("New Talent")
                              : Text(rate.toStringAsFixed(1).toString()),
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

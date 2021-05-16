import 'package:flutter/material.dart';
import 'package:siginsignup/pages/chooselogin.dart';
import 'package:siginsignup/pages/studentReg.dart';
import 'package:siginsignup/pages/teachersPages/teacherReg.dart';

class ChooseReg extends StatefulWidget {
  @override
  _ChooseRegState createState() => _ChooseRegState();
}

class _ChooseRegState extends State<ChooseReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100.0),
            child: Center(
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.blue[300],
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Center(
              child: Text(
            'Create an account',
            style: TextStyle(
              color: Colors.blue[300],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          )),
          SizedBox(
            height: 110.0,
          ),
          Center(
              child: Text(
            'You want to register as?',
            style: TextStyle(
              color: Colors.blue[300],
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          )),
          Container(
            width: 100,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 25, top: 23),
                        child: Image(
                            height: 180,
                            width: 140,
                            image: AssetImage('assets/student.png'),
                            fit: BoxFit.cover),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 125, left: 50),
                        width: 150,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: BorderSide(color: Colors.blue[300])),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StudentReg(),
                                ));
                          },
                          color: Colors.blue[300],
                          textColor: Colors.white,
                          child: Text("STUDNET".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 150,
                    child: Stack(
                      children: [
                        Image(
                            height: 200,
                            width: 200,
                            image: AssetImage('assets/teacher.png'),
                            fit: BoxFit.cover),
                        Container(
                          width: 125,
                          padding: EdgeInsets.only(top: 125, left: 30),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                side: BorderSide(color: Colors.blue[300])),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TeacherReg(),
                                  ));
                            },
                            color: Colors.blue[300],
                            textColor: Colors.white,
                            child: Text("tutor".toUpperCase(),
                                style: TextStyle(fontSize: 14)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You have an account?'),
              SizedBox(width: 2.0),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Chooselogin(),
                      ));
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue[300]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/shared/appbar.dart';

class EditTeacher extends StatefulWidget {
  @override
  _EditTeacherState createState() => _EditTeacherState();
}

class _EditTeacherState extends State<EditTeacher> {
  String sname, fname, desc, country, headline;
  String gender = 'Male';
  String email;
  String mss = '';
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String ref;
  int group = 1;
  @override
  Widget build(BuildContext context) {
    ref = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: Wid().appbar("edit your profile"),
      body: ListView(children: [
        SizedBox(
          height: 20.0,
        ),
        Center(
          child: Text(mss, style: TextStyle(color: Colors.red)),
        ),
        SizedBox(
          height: 20.0,
        ),
        Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      }
                    },
                    onChanged: (value) {
                      fname = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      }
                    },
                    onChanged: (value) {
                      sname = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Second Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      }
                    },
                    onChanged: (value) {
                      country = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Country',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      }
                    },
                    onChanged: (value) {
                      fname = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Description',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      }
                    },
                    onChanged: (value) {
                      headline = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Headline',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Center(
                child: Container(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 1,
                  groupValue: group,
                  onChanged: (value) {
                    setState(() {
                      group = value;
                      gender = 'Male';
                    });
                  },
                ),
                Text(
                  'Male',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                SizedBox(
                  width: 60,
                ),
                Radio(
                  value: 2,
                  groupValue: group,
                  onChanged: (value) {
                    setState(() {
                      group = value;
                      gender = 'Female';
                    });
                  },
                ),
                Text(
                  'Female',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ],
            )))),
        SizedBox(
          height: 15.0,
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
                    'Update'.toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  onPressed: () async {
                    try {
                      if (_formkey.currentState.validate()) {
                        await Firestore.instance
                            .collection('teachers')
                            .document(ref)
                            .updateData({
                          'fname': fname,
                          'lname': sname,
                          'gender': gender,
                          'headline': headline,
                          'desc': desc,
                          'country': country
                        });
                        Navigator.pop(
                          context,
                        );
                      }
                    } catch (e) {
                      print(e.toString() + 'error');
                    }
                  },
                )),
          ),
        ),
      ]),
    );
  }
}

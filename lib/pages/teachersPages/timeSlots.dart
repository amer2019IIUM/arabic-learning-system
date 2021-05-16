import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/pages/teachersPages/teacherdrawer.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/bottombar.dart';
import 'package:siginsignup/shared/shareddialog.dart';

import '../../theme.dart';
import 'notification.dart';
import 'teacherChat.dart';
import 'teacherPage.dart';

class SlotTime extends StatefulWidget {
  @override
  _SlotTimeState createState() => _SlotTimeState();
}

enum ButtonAction {
  cancel,
  agree,
}

class _SlotTimeState extends State<SlotTime> {
  static const routeName = '/ScrollableTab';
  void showMaterialDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    );
  }

  String chipName1;
  String chipName2;
  String chipName3;
  String chipName4;
  String chipName5;
  String chipName6;
  String chipName7;
  String chipName8;
  String chipName9;
  String chipName10;
  String chipName11;
  String chipName12;
  String chipName13;
  String chipName14;
  String chipName15;
  String chipName16;
  String chipName17;
  String chipName18;
  String chipName19;
  String chipName20;
  String chipName21;
  String chipName22;
  String chipName23;
  String chipName24;
  List slotTime = [];
  var _isSelected1 = false;
  var _isSelected2 = false;
  var _isSelected3 = false;
  var _isSelected4 = false;
  var _isSelected5 = false;
  var _isSelected6 = false;
  var _isSelected7 = false;
  var _isSelected8 = false;
  var _isSelected9 = false;
  var _isSelected10 = false;
  var _isSelected11 = false;
  var _isSelected12 = false;
  var _isSelected13 = false;
  var _isSelected14 = false;
  var _isSelected15 = false;
  var _isSelected16 = false;
  var _isSelected17 = false;
  var _isSelected18 = false;
  var _isSelected19 = false;
  var _isSelected20 = false;
  var _isSelected21 = false;
  var _isSelected22 = false;
  var _isSelected23 = false;
  var _isSelected24 = false;
  List passId;

  @override
  Widget build(BuildContext context) {
    passId = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return new DefaultTabController(
        length: 7,
        child: new Scaffold(
            appBar: new AppBar(
              backgroundColor: selectedColor,
              centerTitle: true,
              title: new Text(
                "Range your schedule".toUpperCase(),
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 21.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              bottom: new TabBar(
                isScrollable: true,
                tabs: <Widget>[
                  new Tab(
                    child: Row(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.purple,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Monday', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  new Tab(
                    child: Row(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.purple,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Tuesday', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  new Tab(
                    child: Row(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.purple,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Wednesday',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  new Tab(
                    child: Row(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.purple,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Thursday', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  new Tab(
                    child: Row(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.purple,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Friday', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  new Tab(
                    child: Row(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.purple,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Saturday', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  new Tab(
                    child: Row(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: Colors.purple,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text('Sunday', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            drawer: TeacherDrawer().drawer(passId[1] + " " + passId[9],
                passId[14], passId[4], context, passId),
            body: new TabBarView(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: <Widget>[
                              FilterChip(
                                label: Text('9:00-10:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName1 = '9:00-10:00';
                                  } else if (isSelected == false) {
                                    chipName1 = null;
                                  }
                                  setState(() {
                                    _isSelected1 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('10:00-11:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName2 = '10:00-11:00';
                                  } else if (isSelected == false) {
                                    chipName2 = null;
                                  }
                                  setState(() {
                                    _isSelected2 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('11:00-12:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName3 = '11:00-12:00';
                                  } else if (isSelected == false) {
                                    chipName3 = null;
                                  }
                                  setState(() {
                                    _isSelected3 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('12:00-13:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName4 = '12:00-13:00';
                                  } else if (isSelected == false) {
                                    chipName4 = null;
                                  }
                                  setState(() {
                                    _isSelected4 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('13:00-14:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName5 = '13:00-14:00';
                                  } else if (isSelected == false) {
                                    chipName5 = null;
                                  }
                                  setState(() {
                                    _isSelected5 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('14:00-15:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName6 = '14:00-15:00';
                                  } else if (isSelected == false) {
                                    chipName6 = null;
                                  }
                                  setState(() {
                                    _isSelected6 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('15:00-16:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName7 = '15:00-16:00';
                                  } else if (isSelected == false) {
                                    chipName7 = null;
                                  }
                                  setState(() {
                                    _isSelected7 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('16:00-17:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName8 = "16:00-17:00";
                                  } else if (isSelected == false) {
                                    chipName8 = null;
                                  }
                                  setState(() {
                                    _isSelected8 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('17:00-18:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected9,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName9 = '17:00-18:00';
                                  } else if (isSelected == false) {
                                    chipName9 = null;
                                  }
                                  setState(() {
                                    _isSelected9 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('18:00-19:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName10 = '19:00-20:00';
                                  } else if (isSelected == false) {
                                    chipName10 = null;
                                  }
                                  setState(() {
                                    _isSelected10 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('20:00-21:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected11,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName11 = '20:00-21:00';
                                  } else if (isSelected == false) {
                                    chipName11 = null;
                                  }
                                  setState(() {
                                    _isSelected11 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('21:00-22:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName12 = "21:00-22:00";
                                  } else if (isSelected == false) {
                                    chipName12 = null;
                                  }
                                  setState(() {
                                    _isSelected12 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('22:00-23:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected13,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName13 = '22:00-23:00';
                                  } else if (isSelected == false) {
                                    chipName13 = null;
                                  }
                                  setState(() {
                                    _isSelected13 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('23:00-24:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected14,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName14 = "23:00-24:00";
                                  } else if (isSelected == false) {
                                    chipName14 = null;
                                  }
                                  setState(() {
                                    _isSelected14 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),

                              Container(
                                padding: const EdgeInsets.only(
                                    right: 50.0, left: 50.0),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20, right: 25),
                                child: RaisedButton(
                                  padding:
                                      EdgeInsets.only(top: 2.0, bottom: 2.0),
                                  elevation: 5,
                                  color: Colors.red[400],
                                  child: new Text(
                                    'Click here if you are busy this day',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    showMaterialDialog<ButtonAction>(
                                      context: context,
                                      child: AlertDialog(
                                        content: Text(
                                          'Confirm your selection',
                                          //  style: dialogTextStyle,
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                            },
                                          ),
                                          FlatButton(
                                            child: const Text('Confirm'),
                                            onPressed: () {
                                              slotTime = [
                                                'This day the tutor is busy'
                                              ];
                                              Service().setTimeMon(
                                                  passId[14].toString(),
                                                  slotTime);
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SlotTime(),
                                                      settings: RouteSettings(
                                                          arguments: passId)));
                                              SharedShowDialog().showdialogSuccessful1(
                                                  context,
                                                  "Your time schedule has been arranged successfully.");
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // RaisedButton(onPressed: () {
                              //   slotTime.add(value9);
                              //   slotTime.add(value10);
                              //   print(slotTime);
                              // })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        elevation: 5,
                        color: Colors.green[400],
                        child: new Text(
                          'Set up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          showMaterialDialog<ButtonAction>(
                            context: context,
                            child: AlertDialog(
                              content: Text(
                                'Confirm your selection',
                                //  style: dialogTextStyle,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context, ButtonAction.cancel);
                                  },
                                ),
                                FlatButton(
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    slotTime.add(chipName1);

                                    slotTime.add(chipName2);
                                    slotTime.add(chipName3);
                                    slotTime.add(chipName4);
                                    slotTime.add(chipName5);
                                    slotTime.add(chipName6);
                                    slotTime.add(chipName7);
                                    slotTime.add(chipName8);
                                    slotTime.add(chipName9);
                                    slotTime.add(chipName10);
                                    slotTime.add(chipName11);
                                    slotTime.add(chipName12);
                                    slotTime.add(chipName13);
                                    slotTime.add(chipName14);
                                    if (slotTime.isEmpty) {
                                      print('it is empty');
                                      MaterialPageRoute(
                                          builder: (context) => SlotTime(),
                                          settings:
                                              RouteSettings(arguments: passId));
                                    } else {
                                      Service().setTimeMon(
                                          passId[14].toString(), slotTime);
                                      Navigator.pop(
                                          context, ButtonAction.cancel);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SlotTime(),
                                              settings: RouteSettings(
                                                  arguments: passId)));
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          new Dialog(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 0.0,
                                        child: new Stack(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 66.0 + 16.0,
                                                bottom: 16.0,
                                                left: 16.0,
                                                right: 16.0,
                                              ),
                                              margin:
                                                  EdgeInsets.only(top: 66.0),
                                              decoration: new BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 16.0,
                                                    offset:
                                                        const Offset(0.0, 16.0),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    "Well Done",
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.teal),
                                                  ),
                                                  SizedBox(height: 16.0),
                                                  Text(
                                                    "Your time schedule has been arranged successfully.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  SizedBox(height: 24.0),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      color: Colors.teal,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 24.0 + 66.0,
                                              right: 24.0 + 66.0,
                                              child: CircleAvatar(
                                                radius: 50.0,
                                                backgroundImage: AssetImage(
                                                    'assets/checklists.png'),
                                                backgroundColor:
                                                    Colors.blueAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                //////////This is the same code
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: <Widget>[
                              FilterChip(
                                label: Text('9:00-10:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName1 = '9:00-10:00';
                                  } else if (isSelected == false) {
                                    chipName1 = null;
                                  }
                                  setState(() {
                                    _isSelected1 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('10:00-11:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName2 = '10:00-11:00';
                                  } else if (isSelected == false) {
                                    chipName2 = null;
                                  }
                                  setState(() {
                                    _isSelected2 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('11:00-12:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName3 = '11:00-12:00';
                                  } else if (isSelected == false) {
                                    chipName3 = null;
                                  }
                                  setState(() {
                                    _isSelected3 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('12:00-13:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName4 = '12:00-13:00';
                                  } else if (isSelected == false) {
                                    chipName4 = null;
                                  }
                                  setState(() {
                                    _isSelected4 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('13:00-14:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName5 = '13:00-14:00';
                                  } else if (isSelected == false) {
                                    chipName5 = null;
                                  }
                                  setState(() {
                                    _isSelected5 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('14:00-15:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName6 = '14:00-15:00';
                                  } else if (isSelected == false) {
                                    chipName6 = null;
                                  }
                                  setState(() {
                                    _isSelected6 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('15:00-16:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName7 = '15:00-16:00';
                                  } else if (isSelected == false) {
                                    chipName7 = null;
                                  }
                                  setState(() {
                                    _isSelected7 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('16:00-17:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName8 = "16:00-17:00";
                                  } else if (isSelected == false) {
                                    chipName8 = null;
                                  }
                                  setState(() {
                                    _isSelected8 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('17:00-18:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected9,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName9 = '17:00-18:00';
                                  } else if (isSelected == false) {
                                    chipName9 = null;
                                  }
                                  setState(() {
                                    _isSelected9 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('18:00-19:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName10 = '19:00-20:00';
                                  } else if (isSelected == false) {
                                    chipName10 = null;
                                  }
                                  setState(() {
                                    _isSelected10 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('20:00-21:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected11,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName11 = '20:00-21:00';
                                  } else if (isSelected == false) {
                                    chipName11 = null;
                                  }
                                  setState(() {
                                    _isSelected11 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('21:00-22:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName12 = "21:00-22:00";
                                  } else if (isSelected == false) {
                                    chipName12 = null;
                                  }
                                  setState(() {
                                    _isSelected12 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('22:00-23:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected13,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName13 = '22:00-23:00';
                                  } else if (isSelected == false) {
                                    chipName13 = null;
                                  }
                                  setState(() {
                                    _isSelected13 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('23:00-24:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected14,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName14 = "23:00-24:00";
                                  } else if (isSelected == false) {
                                    chipName14 = null;
                                  }
                                  setState(() {
                                    _isSelected14 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),

                              Container(
                                padding: const EdgeInsets.only(
                                    right: 50.0, left: 50.0),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20, right: 25),
                                child: RaisedButton(
                                  padding:
                                      EdgeInsets.only(top: 2.0, bottom: 2.0),
                                  elevation: 5,
                                  color: Colors.red[400],
                                  child: new Text(
                                    'Click here if you are busy this day',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    showMaterialDialog<ButtonAction>(
                                      context: context,
                                      child: AlertDialog(
                                        content: Text(
                                          'Confirm your selection',
                                          //  style: dialogTextStyle,
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                            },
                                          ),
                                          FlatButton(
                                            child: const Text('Confirm'),
                                            onPressed: () {
                                              slotTime = [
                                                'This day the tutor is busy'
                                              ];
                                              Service().setTimeTus(
                                                  passId[14].toString(),
                                                  slotTime);
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SlotTime(),
                                                      settings: RouteSettings(
                                                          arguments: passId)));
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        new Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  elevation: 0.0,
                                                  child: new Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 66.0 + 16.0,
                                                          bottom: 16.0,
                                                          left: 16.0,
                                                          right: 16.0,
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            top: 66.0),
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 16.0,
                                                              offset:
                                                                  const Offset(
                                                                      0.0,
                                                                      16.0),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            Text(
                                                              "Well Done",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .teal),
                                                            ),
                                                            SizedBox(
                                                                height: 16.0),
                                                            Text(
                                                              "Your time schedule has been arranged successfully.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 24.0),
                                                            Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child:
                                                                  RaisedButton(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0)),
                                                                color:
                                                                    Colors.teal,
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  "Close",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 24.0 + 66.0,
                                                        right: 24.0 + 66.0,
                                                        child: CircleAvatar(
                                                          radius: 50.0,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assets/checklists.png'),
                                                          backgroundColor:
                                                              Colors.blueAccent,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // RaisedButton(onPressed: () {
                              //   slotTime.add(value9);
                              //   slotTime.add(value10);
                              //   print(slotTime);
                              // })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        elevation: 5,
                        color: Colors.green[400],
                        child: new Text(
                          'Set up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          showMaterialDialog<ButtonAction>(
                            context: context,
                            child: AlertDialog(
                              content: Text(
                                'Confirm your selection',
                                //  style: dialogTextStyle,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context, ButtonAction.cancel);
                                  },
                                ),
                                FlatButton(
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    slotTime.add(chipName1);

                                    slotTime.add(chipName2);
                                    slotTime.add(chipName3);
                                    slotTime.add(chipName4);
                                    slotTime.add(chipName5);
                                    slotTime.add(chipName6);
                                    slotTime.add(chipName7);
                                    slotTime.add(chipName8);
                                    slotTime.add(chipName9);
                                    slotTime.add(chipName10);
                                    slotTime.add(chipName11);
                                    slotTime.add(chipName12);
                                    slotTime.add(chipName13);
                                    slotTime.add(chipName14);
                                    if (slotTime.isEmpty) {
                                      print('it is empty');
                                      MaterialPageRoute(
                                          builder: (context) => SlotTime(),
                                          settings:
                                              RouteSettings(arguments: passId));
                                    } else {
                                      Service().setTimeTus(
                                          passId[14].toString(), slotTime);
                                      Navigator.pop(
                                          context, ButtonAction.cancel);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SlotTime(),
                                              settings: RouteSettings(
                                                  arguments: passId)));
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          new Dialog(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 0.0,
                                        child: new Stack(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 66.0 + 16.0,
                                                bottom: 16.0,
                                                left: 16.0,
                                                right: 16.0,
                                              ),
                                              margin:
                                                  EdgeInsets.only(top: 66.0),
                                              decoration: new BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 16.0,
                                                    offset:
                                                        const Offset(0.0, 16.0),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    "Well Done",
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.teal),
                                                  ),
                                                  SizedBox(height: 16.0),
                                                  Text(
                                                    "Your time schedule has been arranged successfully.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  SizedBox(height: 24.0),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      color: Colors.teal,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 24.0 + 66.0,
                                              right: 24.0 + 66.0,
                                              child: CircleAvatar(
                                                radius: 50.0,
                                                backgroundImage: AssetImage(
                                                    'assets/checklists.png'),
                                                backgroundColor:
                                                    Colors.blueAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: <Widget>[
                              FilterChip(
                                label: Text('9:00-10:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName1 = '9:00-10:00';
                                  } else if (isSelected == false) {
                                    chipName1 = null;
                                  }
                                  setState(() {
                                    _isSelected1 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('10:00-11:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName2 = '10:00-11:00';
                                  } else if (isSelected == false) {
                                    chipName2 = null;
                                  }
                                  setState(() {
                                    _isSelected2 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('11:00-12:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName3 = '11:00-12:00';
                                  } else if (isSelected == false) {
                                    chipName3 = '';
                                  }
                                  setState(() {
                                    _isSelected3 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('12:00-13:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName4 = '12:00-13:00';
                                  } else if (isSelected == false) {
                                    chipName4 = null;
                                  }
                                  setState(() {
                                    _isSelected4 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('13:00-14:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName5 = '13:00-14:00';
                                  } else if (isSelected == false) {
                                    chipName5 = null;
                                  }
                                  setState(() {
                                    _isSelected5 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('14:00-15:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName6 = '14:00-15:00';
                                  } else if (isSelected == false) {
                                    chipName6 = null;
                                  }
                                  setState(() {
                                    _isSelected6 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('15:00-16:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName7 = '15:00-16:00';
                                  } else if (isSelected == false) {
                                    chipName7 = null;
                                  }
                                  setState(() {
                                    _isSelected7 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('16:00-17:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName8 = "16:00-17:00";
                                  } else if (isSelected == false) {
                                    chipName8 = null;
                                  }
                                  setState(() {
                                    _isSelected8 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('17:00-18:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected9,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName9 = '17:00-18:00';
                                  } else if (isSelected == false) {
                                    chipName9 = null;
                                  }
                                  setState(() {
                                    _isSelected9 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('18:00-19:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName10 = '19:00-20:00';
                                  } else if (isSelected == false) {
                                    chipName10 = null;
                                  }
                                  setState(() {
                                    _isSelected10 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('20:00-21:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected11,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName11 = '20:00-21:00';
                                  } else if (isSelected == false) {
                                    chipName11 = null;
                                  }
                                  setState(() {
                                    _isSelected11 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('21:00-22:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName12 = "21:00-22:00";
                                  } else if (isSelected == false) {
                                    chipName12 = null;
                                  }
                                  setState(() {
                                    _isSelected12 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('22:00-23:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected13,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName13 = '22:00-23:00';
                                  } else if (isSelected == false) {
                                    chipName13 = null;
                                  }
                                  setState(() {
                                    _isSelected13 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('23:00-24:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected14,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName14 = "23:00-24:00";
                                  } else if (isSelected == false) {
                                    chipName14 = null;
                                  }
                                  setState(() {
                                    _isSelected14 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),

                              Container(
                                padding: const EdgeInsets.only(
                                    right: 50.0, left: 50.0),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20, right: 25),
                                child: RaisedButton(
                                  padding:
                                      EdgeInsets.only(top: 2.0, bottom: 2.0),
                                  elevation: 5,
                                  color: Colors.red[400],
                                  child: new Text(
                                    'Click here if you are busy this day',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    showMaterialDialog<ButtonAction>(
                                      context: context,
                                      child: AlertDialog(
                                        content: Text(
                                          'Confirm your selection',
                                          //  style: dialogTextStyle,
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                            },
                                          ),
                                          FlatButton(
                                            child: const Text('Confirm'),
                                            onPressed: () {
                                              slotTime = [
                                                'This day the tutor is busy'
                                              ];
                                              Service().setTimeWen(
                                                  passId[14].toString(),
                                                  slotTime);
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SlotTime(),
                                                      settings: RouteSettings(
                                                          arguments: passId)));
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        new Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  elevation: 0.0,
                                                  child: new Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 66.0 + 16.0,
                                                          bottom: 16.0,
                                                          left: 16.0,
                                                          right: 16.0,
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            top: 66.0),
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 16.0,
                                                              offset:
                                                                  const Offset(
                                                                      0.0,
                                                                      16.0),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            Text(
                                                              "Well Done",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .teal),
                                                            ),
                                                            SizedBox(
                                                                height: 16.0),
                                                            Text(
                                                              "Your time schedule has been arranged successfully.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 24.0),
                                                            Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child:
                                                                  RaisedButton(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0)),
                                                                color:
                                                                    Colors.teal,
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  "Close",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 24.0 + 66.0,
                                                        right: 24.0 + 66.0,
                                                        child: CircleAvatar(
                                                          radius: 50.0,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assets/checklists.png'),
                                                          backgroundColor:
                                                              Colors.blueAccent,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // RaisedButton(onPressed: () {
                              //   slotTime.add(value9);
                              //   slotTime.add(value10);
                              //   print(slotTime);
                              // })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        elevation: 5,
                        color: Colors.green[400],
                        child: new Text(
                          'Set up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          showMaterialDialog<ButtonAction>(
                            context: context,
                            child: AlertDialog(
                              content: Text(
                                'Confirm your selection',
                                //  style: dialogTextStyle,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context, ButtonAction.cancel);
                                  },
                                ),
                                FlatButton(
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    slotTime.add(chipName1);

                                    slotTime.add(chipName2);
                                    slotTime.add(chipName3);
                                    slotTime.add(chipName4);
                                    slotTime.add(chipName5);
                                    slotTime.add(chipName6);
                                    slotTime.add(chipName7);
                                    slotTime.add(chipName8);
                                    slotTime.add(chipName9);
                                    slotTime.add(chipName10);
                                    slotTime.add(chipName11);
                                    slotTime.add(chipName12);
                                    slotTime.add(chipName13);
                                    slotTime.add(chipName14);
                                    if (slotTime.isEmpty) {
                                      print('it is empty');
                                      MaterialPageRoute(
                                          builder: (context) => SlotTime(),
                                          settings:
                                              RouteSettings(arguments: passId));
                                    } else {
                                      Service().setTimeWen(
                                          passId[14].toString(), slotTime);
                                      Navigator.pop(
                                          context, ButtonAction.cancel);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SlotTime(),
                                              settings: RouteSettings(
                                                  arguments: passId)));
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          new Dialog(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 0.0,
                                        child: new Stack(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 66.0 + 16.0,
                                                bottom: 16.0,
                                                left: 16.0,
                                                right: 16.0,
                                              ),
                                              margin:
                                                  EdgeInsets.only(top: 66.0),
                                              decoration: new BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 16.0,
                                                    offset:
                                                        const Offset(0.0, 16.0),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    "Well Done",
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.teal),
                                                  ),
                                                  SizedBox(height: 16.0),
                                                  Text(
                                                    "Your time schedule has been arranged successfully.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  SizedBox(height: 24.0),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      color: Colors.teal,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 24.0 + 66.0,
                                              right: 24.0 + 66.0,
                                              child: CircleAvatar(
                                                radius: 50.0,
                                                backgroundImage: AssetImage(
                                                    'assets/checklists.png'),
                                                backgroundColor:
                                                    Colors.blueAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: <Widget>[
                              FilterChip(
                                label: Text('9:00-10:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName1 = '9:00-10:00';
                                  } else if (isSelected == false) {
                                    chipName1 = null;
                                  }
                                  setState(() {
                                    _isSelected1 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('10:00-11:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName2 = '10:00-11:00';
                                  } else if (isSelected == false) {
                                    chipName2 = null;
                                  }
                                  setState(() {
                                    _isSelected2 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('11:00-12:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName3 = '11:00-12:00';
                                  } else if (isSelected == false) {
                                    chipName3 = '';
                                  }
                                  setState(() {
                                    _isSelected3 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('12:00-13:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName4 = '12:00-13:00';
                                  } else if (isSelected == false) {
                                    chipName4 = null;
                                  }
                                  setState(() {
                                    _isSelected4 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('13:00-14:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName5 = '13:00-14:00';
                                  } else if (isSelected == false) {
                                    chipName5 = null;
                                  }
                                  setState(() {
                                    _isSelected5 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('14:00-15:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName6 = '14:00-15:00';
                                  } else if (isSelected == false) {
                                    chipName6 = null;
                                  }
                                  setState(() {
                                    _isSelected6 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('15:00-16:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName7 = '15:00-16:00';
                                  } else if (isSelected == false) {
                                    chipName7 = null;
                                  }
                                  setState(() {
                                    _isSelected7 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('16:00-17:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName8 = "16:00-17:00";
                                  } else if (isSelected == false) {
                                    chipName8 = null;
                                  }
                                  setState(() {
                                    _isSelected8 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('17:00-18:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected9,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName9 = '17:00-18:00';
                                  } else if (isSelected == false) {
                                    chipName9 = null;
                                  }
                                  setState(() {
                                    _isSelected9 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('18:00-19:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName10 = '19:00-20:00';
                                  } else if (isSelected == false) {
                                    chipName10 = null;
                                  }
                                  setState(() {
                                    _isSelected10 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('20:00-21:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected11,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName11 = '20:00-21:00';
                                  } else if (isSelected == false) {
                                    chipName11 = null;
                                  }
                                  setState(() {
                                    _isSelected11 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('21:00-22:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName12 = "21:00-22:00";
                                  } else if (isSelected == false) {
                                    chipName12 = null;
                                  }
                                  setState(() {
                                    _isSelected12 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('22:00-23:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected13,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName13 = '22:00-23:00';
                                  } else if (isSelected == false) {
                                    chipName13 = null;
                                  }
                                  setState(() {
                                    _isSelected13 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('23:00-24:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected14,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName14 = "23:00-24:00";
                                  } else if (isSelected == false) {
                                    chipName14 = null;
                                  }
                                  setState(() {
                                    _isSelected14 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),

                              Container(
                                padding: const EdgeInsets.only(
                                    right: 50.0, left: 50.0),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20, right: 25),
                                child: RaisedButton(
                                  padding:
                                      EdgeInsets.only(top: 2.0, bottom: 2.0),
                                  elevation: 5,
                                  color: Colors.red[400],
                                  child: new Text(
                                    'Click here if you are busy this day',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    showMaterialDialog<ButtonAction>(
                                      context: context,
                                      child: AlertDialog(
                                        content: Text(
                                          'Confirm your selection',
                                          //  style: dialogTextStyle,
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                            },
                                          ),
                                          FlatButton(
                                            child: const Text('Confirm'),
                                            onPressed: () {
                                              slotTime = [
                                                'This day the tutor is busy'
                                              ];
                                              Service().setTimeThru(
                                                  passId[14].toString(),
                                                  slotTime);
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SlotTime(),
                                                      settings: RouteSettings(
                                                          arguments: passId)));
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        new Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  elevation: 0.0,
                                                  child: new Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 66.0 + 16.0,
                                                          bottom: 16.0,
                                                          left: 16.0,
                                                          right: 16.0,
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            top: 66.0),
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 16.0,
                                                              offset:
                                                                  const Offset(
                                                                      0.0,
                                                                      16.0),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            Text(
                                                              "Well Done",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .teal),
                                                            ),
                                                            SizedBox(
                                                                height: 16.0),
                                                            Text(
                                                              "Your time schedule has been arranged successfully.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 24.0),
                                                            Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child:
                                                                  RaisedButton(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0)),
                                                                color:
                                                                    Colors.teal,
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  "Close",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 24.0 + 66.0,
                                                        right: 24.0 + 66.0,
                                                        child: CircleAvatar(
                                                          radius: 50.0,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assets/checklists.png'),
                                                          backgroundColor:
                                                              Colors.blueAccent,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // RaisedButton(onPressed: () {
                              //   slotTime.add(value9);
                              //   slotTime.add(value10);
                              //   print(slotTime);
                              // })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        elevation: 5,
                        color: Colors.green[400],
                        child: new Text(
                          'Set up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          showMaterialDialog<ButtonAction>(
                            context: context,
                            child: AlertDialog(
                              content: Text(
                                'Confirm your selection',
                                //  style: dialogTextStyle,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context, ButtonAction.cancel);
                                  },
                                ),
                                FlatButton(
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    slotTime.add(chipName1);

                                    slotTime.add(chipName2);
                                    slotTime.add(chipName3);
                                    slotTime.add(chipName4);
                                    slotTime.add(chipName5);
                                    slotTime.add(chipName6);
                                    slotTime.add(chipName7);
                                    slotTime.add(chipName8);
                                    slotTime.add(chipName9);
                                    slotTime.add(chipName10);
                                    slotTime.add(chipName11);
                                    slotTime.add(chipName12);
                                    slotTime.add(chipName13);
                                    slotTime.add(chipName14);
                                    if (slotTime.isEmpty) {
                                      print('it is empty');
                                      MaterialPageRoute(
                                          builder: (context) => SlotTime(),
                                          settings:
                                              RouteSettings(arguments: passId));
                                    } else {
                                      Service().setTimeThru(
                                          passId[14].toString(), slotTime);
                                      Navigator.pop(
                                          context, ButtonAction.cancel);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SlotTime(),
                                              settings: RouteSettings(
                                                  arguments: passId)));
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          new Dialog(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 0.0,
                                        child: new Stack(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 66.0 + 16.0,
                                                bottom: 16.0,
                                                left: 16.0,
                                                right: 16.0,
                                              ),
                                              margin:
                                                  EdgeInsets.only(top: 66.0),
                                              decoration: new BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 16.0,
                                                    offset:
                                                        const Offset(0.0, 16.0),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    "Well Done",
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.teal),
                                                  ),
                                                  SizedBox(height: 16.0),
                                                  Text(
                                                    "Your time schedule has been arranged successfully.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  SizedBox(height: 24.0),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      color: Colors.teal,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 24.0 + 66.0,
                                              right: 24.0 + 66.0,
                                              child: CircleAvatar(
                                                radius: 50.0,
                                                backgroundImage: AssetImage(
                                                    'assets/checklists.png'),
                                                backgroundColor:
                                                    Colors.blueAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: <Widget>[
                              FilterChip(
                                label: Text('9:00-10:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName1 = '9:00-10:00';
                                  } else if (isSelected == false) {
                                    chipName1 = null;
                                  }
                                  setState(() {
                                    _isSelected1 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('10:00-11:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName2 = '10:00-11:00';
                                  } else if (isSelected == false) {
                                    chipName2 = null;
                                  }
                                  setState(() {
                                    _isSelected2 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('11:00-12:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName3 = '11:00-12:00';
                                  } else if (isSelected == false) {
                                    chipName3 = null;
                                  }
                                  setState(() {
                                    _isSelected3 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('12:00-13:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName4 = '12:00-13:00';
                                  } else if (isSelected == false) {
                                    chipName4 = null;
                                  }
                                  setState(() {
                                    _isSelected4 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('13:00-14:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName5 = '13:00-14:00';
                                  } else if (isSelected == false) {
                                    chipName5 = null;
                                  }
                                  setState(() {
                                    _isSelected5 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('14:00-15:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName6 = '14:00-15:00';
                                  } else if (isSelected == false) {
                                    chipName6 = null;
                                  }
                                  setState(() {
                                    _isSelected6 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('15:00-16:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName7 = '15:00-16:00';
                                  } else if (isSelected == false) {
                                    chipName7 = null;
                                  }
                                  setState(() {
                                    _isSelected7 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('16:00-17:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName8 = "16:00-17:00";
                                  } else if (isSelected == false) {
                                    chipName8 = null;
                                  }
                                  setState(() {
                                    _isSelected8 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('17:00-18:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected9,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName9 = '17:00-18:00';
                                  } else if (isSelected == false) {
                                    chipName9 = null;
                                  }
                                  setState(() {
                                    _isSelected9 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('18:00-19:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName10 = '19:00-20:00';
                                  } else if (isSelected == false) {
                                    chipName10 = null;
                                  }
                                  setState(() {
                                    _isSelected10 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('20:00-21:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected11,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName11 = '20:00-21:00';
                                  } else if (isSelected == false) {
                                    chipName11 = null;
                                  }
                                  setState(() {
                                    _isSelected11 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('21:00-22:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName12 = "21:00-22:00";
                                  } else if (isSelected == false) {
                                    chipName12 = null;
                                  }
                                  setState(() {
                                    _isSelected12 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('22:00-23:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected13,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName13 = '22:00-23:00';
                                  } else if (isSelected == false) {
                                    chipName13 = null;
                                  }
                                  setState(() {
                                    _isSelected13 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('23:00-24:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected14,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName14 = "23:00-24:00";
                                  } else if (isSelected == false) {
                                    chipName14 = null;
                                  }
                                  setState(() {
                                    _isSelected14 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),

                              Container(
                                padding: const EdgeInsets.only(
                                    right: 50.0, left: 50.0),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20, right: 25),
                                child: RaisedButton(
                                  padding:
                                      EdgeInsets.only(top: 2.0, bottom: 2.0),
                                  elevation: 5,
                                  color: Colors.red[400],
                                  child: new Text(
                                    'Click here if you are busy this day',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    showMaterialDialog<ButtonAction>(
                                      context: context,
                                      child: AlertDialog(
                                        content: Text(
                                          'Confirm your selection',
                                          //  style: dialogTextStyle,
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                            },
                                          ),
                                          FlatButton(
                                            child: const Text('Confirm'),
                                            onPressed: () {
                                              slotTime = [
                                                'This day the tutor is busy'
                                              ];
                                              Service().setTimeFri(
                                                  passId[14].toString(),
                                                  slotTime);
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SlotTime(),
                                                      settings: RouteSettings(
                                                          arguments: passId)));
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        new Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  elevation: 0.0,
                                                  child: new Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 66.0 + 16.0,
                                                          bottom: 16.0,
                                                          left: 16.0,
                                                          right: 16.0,
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            top: 66.0),
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 16.0,
                                                              offset:
                                                                  const Offset(
                                                                      0.0,
                                                                      16.0),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            Text(
                                                              "Well Done",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .teal),
                                                            ),
                                                            SizedBox(
                                                                height: 16.0),
                                                            Text(
                                                              "Your time schedule has been arranged successfully.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 24.0),
                                                            Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child:
                                                                  RaisedButton(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0)),
                                                                color:
                                                                    Colors.teal,
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  "Close",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 24.0 + 66.0,
                                                        right: 24.0 + 66.0,
                                                        child: CircleAvatar(
                                                          radius: 50.0,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assets/checklists.png'),
                                                          backgroundColor:
                                                              Colors.blueAccent,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // RaisedButton(onPressed: () {
                              //   slotTime.add(value9);
                              //   slotTime.add(value10);
                              //   print(slotTime);
                              // })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        elevation: 5,
                        color: Colors.green[400],
                        child: new Text(
                          'Set up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          showMaterialDialog<ButtonAction>(
                            context: context,
                            child: AlertDialog(
                              content: Text(
                                'Confirm your selection',
                                //  style: dialogTextStyle,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context, ButtonAction.cancel);
                                  },
                                ),
                                FlatButton(
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    slotTime.add(chipName1);

                                    slotTime.add(chipName2);
                                    slotTime.add(chipName3);
                                    slotTime.add(chipName4);
                                    slotTime.add(chipName5);
                                    slotTime.add(chipName6);
                                    slotTime.add(chipName7);
                                    slotTime.add(chipName8);
                                    slotTime.add(chipName9);
                                    slotTime.add(chipName10);
                                    slotTime.add(chipName11);
                                    slotTime.add(chipName12);
                                    slotTime.add(chipName13);
                                    slotTime.add(chipName14);
                                    if (slotTime.isEmpty) {
                                      print('it is empty');
                                      MaterialPageRoute(
                                          builder: (context) => SlotTime(),
                                          settings:
                                              RouteSettings(arguments: passId));
                                    } else {
                                      Service().setTimeFri(
                                          passId[14].toString(), slotTime);
                                      Navigator.pop(
                                          context, ButtonAction.cancel);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SlotTime(),
                                              settings: RouteSettings(
                                                  arguments: passId)));
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          new Dialog(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 0.0,
                                        child: new Stack(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 66.0 + 16.0,
                                                bottom: 16.0,
                                                left: 16.0,
                                                right: 16.0,
                                              ),
                                              margin:
                                                  EdgeInsets.only(top: 66.0),
                                              decoration: new BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 16.0,
                                                    offset:
                                                        const Offset(0.0, 16.0),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    "Well Done",
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.teal),
                                                  ),
                                                  SizedBox(height: 16.0),
                                                  Text(
                                                    "Your time schedule has been arranged successfully.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  SizedBox(height: 24.0),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      color: Colors.teal,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 24.0 + 66.0,
                                              right: 24.0 + 66.0,
                                              child: CircleAvatar(
                                                radius: 50.0,
                                                backgroundImage: AssetImage(
                                                    'assets/checklists.png'),
                                                backgroundColor:
                                                    Colors.blueAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: <Widget>[
                              FilterChip(
                                label: Text('9:00-10:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName1 = '9:00-10:00';
                                  } else if (isSelected == false) {
                                    chipName1 = null;
                                  }
                                  setState(() {
                                    _isSelected1 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('10:00-11:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName2 = '10:00-11:00';
                                  } else if (isSelected == false) {
                                    chipName2 = null;
                                  }
                                  setState(() {
                                    _isSelected2 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('11:00-12:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName3 = '11:00-12:00';
                                  } else if (isSelected == false) {
                                    chipName3 = null;
                                  }
                                  setState(() {
                                    _isSelected3 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('12:00-13:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName4 = '12:00-13:00';
                                  } else if (isSelected == false) {
                                    chipName4 = null;
                                  }
                                  setState(() {
                                    _isSelected4 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('13:00-14:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName5 = '13:00-14:00';
                                  } else if (isSelected == false) {
                                    chipName5 = null;
                                  }
                                  setState(() {
                                    _isSelected5 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('14:00-15:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName6 = '14:00-15:00';
                                  } else if (isSelected == false) {
                                    chipName6 = null;
                                  }
                                  setState(() {
                                    _isSelected6 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('15:00-16:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName7 = '15:00-16:00';
                                  } else if (isSelected == false) {
                                    chipName7 = null;
                                  }
                                  setState(() {
                                    _isSelected7 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('16:00-17:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName8 = "16:00-17:00";
                                  } else if (isSelected == false) {
                                    chipName8 = null;
                                  }
                                  setState(() {
                                    _isSelected8 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('17:00-18:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected9,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName9 = '17:00-18:00';
                                  } else if (isSelected == false) {
                                    chipName9 = null;
                                  }
                                  setState(() {
                                    _isSelected9 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('18:00-19:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName10 = '19:00-20:00';
                                  } else if (isSelected == false) {
                                    chipName10 = null;
                                  }
                                  setState(() {
                                    _isSelected10 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('20:00-21:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected11,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName11 = '20:00-21:00';
                                  } else if (isSelected == false) {
                                    chipName11 = null;
                                  }
                                  setState(() {
                                    _isSelected11 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('21:00-22:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName12 = "21:00-22:00";
                                  } else if (isSelected == false) {
                                    chipName12 = null;
                                  }
                                  setState(() {
                                    _isSelected12 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('22:00-23:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected13,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName13 = '22:00-23:00';
                                  } else if (isSelected == false) {
                                    chipName13 = null;
                                  }
                                  setState(() {
                                    _isSelected13 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('23:00-24:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected14,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName14 = "23:00-24:00";
                                  } else if (isSelected == false) {
                                    chipName14 = null;
                                  }
                                  setState(() {
                                    _isSelected14 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),

                              Container(
                                padding: const EdgeInsets.only(
                                    right: 50.0, left: 50.0),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20, right: 25),
                                child: RaisedButton(
                                  padding:
                                      EdgeInsets.only(top: 2.0, bottom: 2.0),
                                  elevation: 5,
                                  color: Colors.red[400],
                                  child: new Text(
                                    'Click here if you are busy this day',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    showMaterialDialog<ButtonAction>(
                                      context: context,
                                      child: AlertDialog(
                                        content: Text(
                                          'Confirm your selection',
                                          //  style: dialogTextStyle,
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                            },
                                          ),
                                          FlatButton(
                                            child: const Text('Confirm'),
                                            onPressed: () {
                                              slotTime = [
                                                'This day the tutor is busy'
                                              ];
                                              Service().setTimeSa(
                                                  passId[14].toString(),
                                                  slotTime);
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SlotTime(),
                                                      settings: RouteSettings(
                                                          arguments: passId)));
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        new Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  elevation: 0.0,
                                                  child: new Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 66.0 + 16.0,
                                                          bottom: 16.0,
                                                          left: 16.0,
                                                          right: 16.0,
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            top: 66.0),
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 16.0,
                                                              offset:
                                                                  const Offset(
                                                                      0.0,
                                                                      16.0),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            Text(
                                                              "Well Done",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .teal),
                                                            ),
                                                            SizedBox(
                                                                height: 16.0),
                                                            Text(
                                                              "Your time schedule has been arranged successfully.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 24.0),
                                                            Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child:
                                                                  RaisedButton(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0)),
                                                                color:
                                                                    Colors.teal,
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  "Close",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 24.0 + 66.0,
                                                        right: 24.0 + 66.0,
                                                        child: CircleAvatar(
                                                          radius: 50.0,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assets/checklists.png'),
                                                          backgroundColor:
                                                              Colors.blueAccent,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // RaisedButton(onPressed: () {
                              //   slotTime.add(value9);
                              //   slotTime.add(value10);
                              //   print(slotTime);
                              // })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        elevation: 5,
                        color: Colors.green[400],
                        child: new Text(
                          'Set up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          showMaterialDialog<ButtonAction>(
                            context: context,
                            child: AlertDialog(
                              content: Text(
                                'Confirm your selection',
                                //  style: dialogTextStyle,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context, ButtonAction.cancel);
                                  },
                                ),
                                FlatButton(
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    slotTime.add(chipName1);

                                    slotTime.add(chipName2);
                                    slotTime.add(chipName3);
                                    slotTime.add(chipName4);
                                    slotTime.add(chipName5);
                                    slotTime.add(chipName6);
                                    slotTime.add(chipName7);
                                    slotTime.add(chipName8);
                                    slotTime.add(chipName9);
                                    slotTime.add(chipName10);
                                    slotTime.add(chipName11);
                                    slotTime.add(chipName12);
                                    slotTime.add(chipName13);
                                    slotTime.add(chipName14);
                                    if (slotTime.isEmpty) {
                                      print('it is empty');
                                      MaterialPageRoute(
                                          builder: (context) => SlotTime(),
                                          settings:
                                              RouteSettings(arguments: passId));
                                    } else {
                                      Service().setTimeSa(
                                          passId[14].toString(), slotTime);
                                      Navigator.pop(
                                          context, ButtonAction.cancel);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SlotTime(),
                                              settings: RouteSettings(
                                                  arguments: passId)));
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          new Dialog(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 0.0,
                                        child: new Stack(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 66.0 + 16.0,
                                                bottom: 16.0,
                                                left: 16.0,
                                                right: 16.0,
                                              ),
                                              margin:
                                                  EdgeInsets.only(top: 66.0),
                                              decoration: new BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 16.0,
                                                    offset:
                                                        const Offset(0.0, 16.0),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    "Well Done",
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.teal),
                                                  ),
                                                  SizedBox(height: 16.0),
                                                  Text(
                                                    "Your time schedule has been arranged successfully.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  SizedBox(height: 24.0),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      color: Colors.teal,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 24.0 + 66.0,
                                              right: 24.0 + 66.0,
                                              child: CircleAvatar(
                                                radius: 50.0,
                                                backgroundImage: AssetImage(
                                                    'assets/checklists.png'),
                                                backgroundColor:
                                                    Colors.blueAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: <Widget>[
                              FilterChip(
                                label: Text('9:00-10:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName1 = '9:00-10:00';
                                  } else if (isSelected == false) {
                                    chipName1 = null;
                                  }
                                  setState(() {
                                    _isSelected1 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('10:00-11:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName2 = '10:00-11:00';
                                  } else if (isSelected == false) {
                                    chipName2 = null;
                                  }
                                  setState(() {
                                    _isSelected2 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('11:00-12:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName3 = '11:00-12:00';
                                  } else if (isSelected == false) {
                                    chipName3 = null;
                                  }
                                  setState(() {
                                    _isSelected3 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('12:00-13:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName4 = '12:00-13:00';
                                  } else if (isSelected == false) {
                                    chipName4 = null;
                                  }
                                  setState(() {
                                    _isSelected4 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('13:00-14:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName5 = '13:00-14:00';
                                  } else if (isSelected == false) {
                                    chipName5 = null;
                                  }
                                  setState(() {
                                    _isSelected5 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('14:00-15:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName6 = '14:00-15:00';
                                  } else if (isSelected == false) {
                                    chipName6 = null;
                                  }
                                  setState(() {
                                    _isSelected6 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('15:00-16:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName7 = '15:00-16:00';
                                  } else if (isSelected == false) {
                                    chipName7 = null;
                                  }
                                  setState(() {
                                    _isSelected7 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('16:00-17:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName8 = "16:00-17:00";
                                  } else if (isSelected == false) {
                                    chipName8 = null;
                                  }
                                  setState(() {
                                    _isSelected8 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('17:00-18:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected9,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName9 = '17:00-18:00';
                                  } else if (isSelected == false) {
                                    chipName9 = null;
                                  }
                                  setState(() {
                                    _isSelected9 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('18:00-19:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName10 = '19:00-20:00';
                                  } else if (isSelected == false) {
                                    chipName10 = null;
                                  }
                                  setState(() {
                                    _isSelected10 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('20:00-21:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected11,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName11 = '20:00-21:00';
                                  } else if (isSelected == false) {
                                    chipName11 = null;
                                  }
                                  setState(() {
                                    _isSelected11 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('21:00-22:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName12 = "21:00-22:00";
                                  } else if (isSelected == false) {
                                    chipName12 = null;
                                  }
                                  setState(() {
                                    _isSelected12 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('22:00-23:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected13,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName13 = '22:00-23:00';
                                  } else if (isSelected == false) {
                                    chipName13 = null;
                                  }
                                  setState(() {
                                    _isSelected13 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),
                              FilterChip(
                                label: Text('23:00-24:00'),
                                labelStyle: TextStyle(
                                    color: Color(0xff6200ee),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                selected: _isSelected14,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Color(0xffededed),
                                onSelected: (isSelected) {
                                  if (isSelected == true) {
                                    chipName14 = "23:00-24:00";
                                  } else if (isSelected == false) {
                                    chipName14 = null;
                                  }
                                  setState(() {
                                    _isSelected14 = isSelected;
                                  });
                                },
                                selectedColor: Color(0xffeadffd),
                              ),

                              Container(
                                padding: const EdgeInsets.only(
                                    right: 50.0, left: 50.0),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20, right: 25),
                                child: RaisedButton(
                                  padding:
                                      EdgeInsets.only(top: 2.0, bottom: 2.0),
                                  elevation: 5,
                                  color: Colors.red[400],
                                  child: new Text(
                                    'Click here if you are busy this day',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    showMaterialDialog<ButtonAction>(
                                      context: context,
                                      child: AlertDialog(
                                        content: Text(
                                          'Confirm your selection',
                                          //  style: dialogTextStyle,
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                            },
                                          ),
                                          FlatButton(
                                            child: const Text('Confirm'),
                                            onPressed: () {
                                              slotTime = [
                                                'This day the tutor is busy'
                                              ];
                                              Service().setTimeSunday(
                                                  passId[14].toString(),
                                                  slotTime);
                                              Navigator.pop(
                                                  context, ButtonAction.cancel);
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SlotTime(),
                                                      settings: RouteSettings(
                                                          arguments: passId)));
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        new Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  elevation: 0.0,
                                                  child: new Stack(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 66.0 + 16.0,
                                                          bottom: 16.0,
                                                          left: 16.0,
                                                          right: 16.0,
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            top: 66.0),
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: Colors.white,
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 16.0,
                                                              offset:
                                                                  const Offset(
                                                                      0.0,
                                                                      16.0),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: <Widget>[
                                                            Text(
                                                              "Well Done",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .teal),
                                                            ),
                                                            SizedBox(
                                                                height: 16.0),
                                                            Text(
                                                              "Your time schedule has been arranged successfully.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 16.0,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 24.0),
                                                            Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child:
                                                                  RaisedButton(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0)),
                                                                color:
                                                                    Colors.teal,
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  "Close",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 24.0 + 66.0,
                                                        right: 24.0 + 66.0,
                                                        child: CircleAvatar(
                                                          radius: 50.0,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assets/checklists.png'),
                                                          backgroundColor:
                                                              Colors.blueAccent,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // RaisedButton(onPressed: () {
                              //   slotTime.add(value9);
                              //   slotTime.add(value10);
                              //   print(slotTime);
                              // })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        elevation: 5,
                        color: Colors.green[400],
                        child: new Text(
                          'Set up',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          showMaterialDialog<ButtonAction>(
                            context: context,
                            child: AlertDialog(
                              content: Text(
                                'Confirm your selection',
                                //  style: dialogTextStyle,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context, ButtonAction.cancel);
                                  },
                                ),
                                FlatButton(
                                  child: const Text('Confirm'),
                                  onPressed: () {
                                    slotTime.add(chipName1);

                                    slotTime.add(chipName2);
                                    slotTime.add(chipName3);
                                    slotTime.add(chipName4);
                                    slotTime.add(chipName5);
                                    slotTime.add(chipName6);
                                    slotTime.add(chipName7);
                                    slotTime.add(chipName8);
                                    slotTime.add(chipName9);
                                    slotTime.add(chipName10);
                                    slotTime.add(chipName11);
                                    slotTime.add(chipName12);
                                    slotTime.add(chipName13);
                                    slotTime.add(chipName14);
                                    if (slotTime.isEmpty) {
                                      print('it is empty');
                                      MaterialPageRoute(
                                          builder: (context) => SlotTime(),
                                          settings:
                                              RouteSettings(arguments: passId));
                                    } else {
                                      Service().setTimeSunday(
                                          passId[14].toString(), slotTime);
                                      Navigator.pop(
                                          context, ButtonAction.cancel);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SlotTime(),
                                              settings: RouteSettings(
                                                  arguments: passId)));
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          new Dialog(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 0.0,
                                        child: new Stack(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 66.0 + 16.0,
                                                bottom: 16.0,
                                                left: 16.0,
                                                right: 16.0,
                                              ),
                                              margin:
                                                  EdgeInsets.only(top: 66.0),
                                              decoration: new BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 16.0,
                                                    offset:
                                                        const Offset(0.0, 16.0),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    "Well Done",
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.teal),
                                                  ),
                                                  SizedBox(height: 16.0),
                                                  Text(
                                                    "Your time schedule has been arranged successfully.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  SizedBox(height: 24.0),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0)),
                                                      color: Colors.teal,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 24.0 + 66.0,
                                              right: 24.0 + 66.0,
                                              child: CircleAvatar(
                                                radius: 50.0,
                                                backgroundImage: AssetImage(
                                                    'assets/checklists.png'),
                                                backgroundColor:
                                                    Colors.blueAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: BottomBar().bottomBarTeacher(
                context,
                passId,
                Colors.white70,
                Colors.white70,
                Colors.white70,
                Color(0xFF4AC8EA),
                Colors.white70,
                null,
                null,
                null,
                circle(),
                null)));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}

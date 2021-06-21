import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/pages/teachersPages/teachersignin.dart';
import 'package:siginsignup/services/auth.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/DRAWER.dart';
import 'package:siginsignup/shared/Loading.dart';
import 'package:siginsignup/shared/shareddialog.dart';
import 'package:siginsignup/stylingwidget.dart';

class TeacherReg extends StatefulWidget {
  @override
  _TeacherRegState createState() => _TeacherRegState();
}

class _TeacherRegState extends State<TeacherReg> {
  String fname;
  String email;
  String password;
  String icno;
  String country;
  String headline;
  String address;
  String gender = 'Male';
  AuthResult authResult;
  var urlphoto;
  var cv;
  String qualify = '';

  String des;
  String textloadingphoto;
  String loadingcv;
  String errorMessage = '';

  String male = 'Male';
  String female = 'Female';
  int group = 1;
  bool loading = false;
  bool _showAppbar = true; //this is to show app bar
  ScrollController _scrollBottomBarController =
      new ScrollController(); // set controller on scrolling
  bool isScrollingDown = false;
  bool _show = true;
  double bottomBarHeight = 75; // set bottom bar height
  double _bottomBarOffset = 0;

  String chipName1;
  String chipName2;
  String chipName3;
  List slotTime = [];
  String chipName4;
  String chipName5;
  var _isSelected1 = false;
  var _isSelected2 = false;
  var _isSelected3 = false;
  var _isSelected4 = false;
  var _isSelected5 = false;
  @override
  void initState() {
    super.initState();
    myScroll();
  }

  void showBottomBar() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
    });
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          hideBottomBar();
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          showBottomBar();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  var _scaffoldState = GlobalKey<ScaffoldState>();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            key: _scaffoldState,
            drawer: DWidget().drawerAuth("name", "email", "photo", context, []),
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: StylingWidgets().decoratedBox(),
              child: Form(
                key: _formkey,
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          height: MediaQuery.of(context).size.height * 1,
                          margin: EdgeInsets.only(top: 100),
                          child: ListView(
                            children: [
                              Image.asset(
                                "assets/information.png",
                                width: 60,
                                height: 60,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              StylingWidgets().headlinebig("CREATE ACCOUNT"),
                              Center(
                                  child: Text(
                                errorMessage,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )),
                              SizedBox(
                                height: 10.0,
                              ),
                              StylingWidgets().formTextfield(
                                Center(
                                  child: TextFormField(
                                    obscureText: false,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "* Required";
                                      } else
                                        return null;
                                    },
                                    onChanged: (value) {
                                      fname = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Full Name",
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons.home)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              StylingWidgets().formTextfield(
                                Center(
                                  child: TextFormField(
                                    validator: validateEmail,
                                    obscureText: false,
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons.person_sharp)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              StylingWidgets().formTextfield(Center(
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Required";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none,
                                    suffixIcon: Icon(
                                      Icons.vpn_key,
                                    ),
                                  ),
                                ),
                              )),
                              SizedBox(
                                height: 15.0,
                              ),
                              StylingWidgets().formTextfield(
                                Center(
                                  child: TextFormField(
                                    obscureText: false,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "* Required";
                                      } else
                                        return null;
                                    },
                                    onChanged: (value) {
                                      country = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Country",
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons.home)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                height: 80,
                                padding: EdgeInsets.only(left: 15),
                                margin: EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                  color: Colors.pink[50],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextFormField(
                                  obscureText: false,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "* Required";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    des = value;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Description",
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.description)),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              StylingWidgets().formTextfield(
                                Column(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: 15),
                                        alignment: Alignment.bottomLeft,
                                        child: Center(
                                          child: Text(
                                            "Top experience",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                    Wrap(
                                      runSpacing: 2.0,
                                      spacing: 2.0,
                                      children: [
                                        FilterChip(
                                          label: Text('Quran\'s Tajweed'),
                                          labelStyle: TextStyle(
                                              color: Colors.pink[200],
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                          selected: _isSelected1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          backgroundColor: Colors.white,
                                          onSelected: (isSelected) {
                                            if (isSelected == true) {
                                              chipName1 = 'Quran\'s Tajweed';
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
                                          label: Text('Arabic Qrammar'),
                                          labelStyle: TextStyle(
                                              color: Colors.pink[200],
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                          selected: _isSelected2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          backgroundColor: Colors.white,
                                          onSelected: (isSelected) {
                                            if (isSelected == true) {
                                              chipName2 = 'Arabic Qrammar';
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
                                          label: Text('Arabic Sarf'),
                                          labelStyle: TextStyle(
                                              color: Colors.pink[200],
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                          selected: _isSelected3,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          backgroundColor: Colors.white,
                                          onSelected: (isSelected) {
                                            if (isSelected == true) {
                                              chipName3 = 'Arabic Sarf';
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
                                          label: Text('Writting'),
                                          labelStyle: TextStyle(
                                              color: Colors.pink[200],
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                          selected: _isSelected4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          backgroundColor: Colors.white,
                                          onSelected: (isSelected) {
                                            if (isSelected == true) {
                                              chipName4 = 'Writting';
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
                                          label: Text('Speaking'),
                                          labelStyle: TextStyle(
                                              color: Colors.pink[200],
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                          selected: _isSelected5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          backgroundColor: Colors.white,
                                          onSelected: (isSelected) {
                                            if (isSelected == true) {
                                              chipName5 = 'Speaking';
                                            } else if (isSelected == false) {
                                              chipName5 = null;
                                            }
                                            setState(() {
                                              _isSelected5 = isSelected;
                                            });
                                          },
                                          selectedColor: Color(0xffeadffd),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              InkWell(
                                  focusColor: Colors.pink[200],
                                  onTap: () {
                                    if (_formkey.currentState.validate()) {
                                      slotTime.add(chipName1);

                                      slotTime.add(chipName2);
                                      slotTime.add(chipName3);
                                      slotTime.add(chipName4);
                                      slotTime.add(chipName5);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NextPageRes(
                                                  fname,
                                                  email,
                                                  password,
                                                  country,
                                                  des,
                                                  slotTime)));
                                    }
                                  },
                                  child: StylingWidgets().nextBtn("NEXT")),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        top: 30,
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: () =>
                              _scaffoldState.currentState.openDrawer(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class NextPageRes extends StatefulWidget {
  String fname, email, password, country, des;
  List slotTime;
  NextPageRes(this.fname, this.email, this.password, this.country, this.des,
      this.slotTime);
  @override
  _NextPageResState createState() => _NextPageResState();
}

class _NextPageResState extends State<NextPageRes> {
  String address;
  String gender = 'Male';
  AuthResult authResult;
  var urlphoto;
  var cv;
  String qualify = '';

  String des;
  String textloadingphoto;
  String loadingcv;
  String errorMessage = '';

  String male = 'Male';
  String female = 'Female';
  int group = 1;
  bool loading = false;
  String uploadedPhoto = "Upload your photo";
  String uploadedCv = "Upload your cv";
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: StylingWidgets().decoratedBox(),
              child: Form(
                key: _formkey,
                child: StylingWidgets().containerWithRadus(
                  context,
                  ListView(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeacherReg()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "GO BACK",
                                style: GoogleFonts.aBeeZee(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 15.0,
                      ),
                      InkWell(
                        child: StylingWidgets().uploadBtn(uploadedPhoto),
                        onTap: () async {
                          await Permission.photos.request();
                          var perm = await Permission.photos.status;

                          if (perm.isGranted) {
                            PickedFile pickedImage = await ImagePicker()
                                .getImage(source: ImageSource.gallery);
                            var result = File(pickedImage.path);
                            if (result != null) {
                              var snapshot = await FirebaseStorage.instance
                                  .ref()
                                  .child('teachers/profile/${widget.email}')
                                  .putFile(result)
                                  .onComplete;
                              urlphoto = await snapshot.ref.getDownloadURL();
                              setState(() {
                                textloadingphoto = urlphoto.toString();
                                uploadedPhoto = "It is Uploaded";
                              });
                            } else if (result == null) {
                              setState(() {
                                textloadingphoto = '';
                              });

                              SharedShowDialog().showdialogSuccessful1(
                                  context, "Your photo Uploaded Successfully");
                            } else {
                              print('no image taken');
                            }
                          } else {
                            print('denied');
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      InkWell(
                        child: StylingWidgets().uploadBtn(uploadedCv),
                        onTap: () async {
                          File file = await FilePicker.getFile(
                              allowedExtensions: ['pdf', 'doc'],
                              type: FileType.custom);
                          setState(() {});

                          var result = File(file.path);
                          if (result != null) {
                            var snapshot = await FirebaseStorage.instance
                                .ref()
                                .child('teacher/cv/${widget.email}')
                                .putFile(file)
                                .onComplete;
                            cv = await snapshot.ref.getDownloadURL();
                            SharedShowDialog().showdialogSuccessful1(
                                context, "Your CV Uploaded Successfully");
                            setState(() {
                              loadingcv = cv;
                              uploadedCv = "It is Uploaded";
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      StylingWidgets().formTextfield(
                        Center(
                          child: TextFormField(
                            obscureText: false,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "* Required";
                              } else
                                return null;
                            },
                            onChanged: (value) {
                              address = value;
                            },
                            decoration: InputDecoration(
                                hintText: "Address",
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.person_sharp)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      StylingWidgets().formTextfield(Center(
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
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 16),
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
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      Divider(),
                      InkWell(
                        focusColor: Colors.pinkAccent,
                        onTap: () async {
                          if (_formkey.currentState.validate()) {
                            try {
                              setState(() {
                                loading = true;
                              });

                              if (cv != null && textloadingphoto != null) {
                                authResult = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: widget.email,
                                        password: widget.password);

                                Auth().registerTutors(
                                    authResult.user.uid,
                                    widget.fname,
                                    widget.email,
                                    widget.password,
                                    widget.country,
                                    textloadingphoto,
                                    widget.fname.substring(0, 1).toUpperCase(),
                                    widget.des,
                                    cv,
                                    gender,
                                    address,
                                    widget.slotTime);
                                Service().setTimeMonNull(widget.email);
                                Service().setTimeTusNull(widget.email);
                                Service().setTimeWenNull(widget.email);
                                Service().setTimeThruNull(widget.email);
                                Service().setTimeFriNull(widget.email);
                                Service().setTimeSaSunNull(widget.email);

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TeacherSign(),
                                    ));
                                if (authResult == null) {
                                  loading = false;
                                }
                              } else {
                                loading = false;

                                SharedShowDialog().dialog2(context,
                                    "Make sure you have uploaded your photo and CV");
                              }
                            } catch (error) {
                              switch (error.code) {
                                case "ERROR_OPERATION_NOT_ALLOWED":
                                  setState(() {
                                    errorMessage = errorMessage =
                                        "Anonymous accounts are not enabled";
                                    loading = false;
                                    SharedShowDialog().dialog2(context,
                                        "Your email address appears to be malformed.");
                                  });

                                  break;
                                case "ERROR_WEAK_PASSWORD":
                                  setState(() {
                                    errorMessage = errorMessage = errorMessage =
                                        "Your password is too weak";
                                    loading = false;
                                    SharedShowDialog().dialog2(context,
                                        "Your email address appears to be malformed.");
                                  });

                                  break;
                                case "ERROR_INVALID_EMAIL":
                                  setState(() {
                                    errorMessage = errorMessage =
                                        errorMessage = "Your email is invalid";
                                    loading = false;
                                  });

                                  break;
                                case "ERROR_EMAIL_ALREADY_IN_USE":
                                  setState(() {
                                    errorMessage =
                                        "Email is already in use on different account";
                                    loading = false;
                                    SharedShowDialog().dialog2(context,
                                        "Your email address appears to be malformed.");
                                  });

                                  break;
                                case "ERROR_INVALID_CREDENTIAL":
                                  setState(() {
                                    errorMessage = "Your email is invalid";
                                    loading = false;
                                  });

                                  break;

                                default:
                                  setState(() {
                                    errorMessage =
                                        "An undefined Error happened.";
                                    loading = false;
                                  });
                              }
                            }
                            if (errorMessage != null) {
                              return Future.error(errorMessage);
                            }
                          } else {
                            print('Not validate');
                            loading = false;
                          }
                        },
                        child: StylingWidgets().signButton("Register"),
                      ),
                      Divider(),
                      Divider()
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

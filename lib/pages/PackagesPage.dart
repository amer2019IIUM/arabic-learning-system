import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:siginsignup/Model/students.dart';
import 'package:siginsignup/const/bottombar.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/bottombar.dart';
import 'package:siginsignup/shared/loading.dart';
import 'package:siginsignup/shared/shareddialog.dart';

import '../stylingwidget.dart';
import 'LearningMaterialPage.dart';
import 'homepage.dart';
import 'package:siginsignup/shared/DRAWER.dart';

class PackagesPage extends StatefulWidget {
  String studentID;
  PackagesPage([this.studentID]);
  @override
  _LearningMaterialState createState() => _LearningMaterialState();
}

class _LearningMaterialState extends State<PackagesPage> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();
  int amount;
  int hasMintues = 0;
  List datastudnets;
  List data;
  String emailStud;
  List lst;
  String studnetEmail;
  int seconds;

  @override
  getStudentData() async {
    emailStud = await HelperFunctions.getUserEmailSharedPreference();

    studnetEmail = await HelperFunctions.getstudentEmail();
    DocumentSnapshot snapshot = await StudentsMod().getStudentData(emailStud);
    lst = snapshot.data.values.toList();

    setState(() {
      datastudnets = lst;
    });

    /////////////////////Check Mintus//
    DocumentSnapshot snapshotMin = await Service().hasMintues(studnetEmail);
    data = snapshotMin.data.values.toList();
    print(data.first);
    setState(() {
      hasMintues = data.first;
    });
  }

  @override
  void initState() {
    getStudentData();
    setState(() {
      datastudnets = lst;
    });
    super.initState();
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) async {
    print("Pament success");
    Fluttertoast.showToast(msg: "success");

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PackagesPage()));
    SharedShowDialog()
        .showdialogSuccessful1(context, "Thank you for your purchase");
    save();
  }

  void handlerErrorFailure() {
    print("Pament error");
    Fluttertoast.showToast(msg: "Error");
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Fluttertoast.showToast(msg: "External wallet");
  }

  void save() async {
    await Service().buyingPurchase(datastudnets[6], seconds);
  }

  void openCheckout1() {
    var options = {
      "key": "rzp_test_y1ti7mXnY3kVoC",
      "amount": num.parse("20") * 100,
      "name": "Sample App",
      "description": "Payment for the some random product",
      "prefill": {"contact": "919255571116", "email": "amer@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
      seconds = 36000;
    } catch (e) {
      print(e.toString());
    }
  }

  void openCheckout2() {
    var options = {
      "key": "rzp_test_y1ti7mXnY3kVoC",
      "amount": num.parse("50") * 100,
      "name": "Sample App",
      "description": "Payment for the some random product",
      "prefill": {"contact": "919255571116", "email": "amer@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
      seconds = 90000;
    } catch (e) {
      print(e.toString());
    }
  }

  void openCheckout3() {
    var options = {
      "key": "rzp_test_y1ti7mXnY3kVoC",
      "amount": num.parse("100") * 100,
      "name": "Sample App",
      "description": "Payment for the some random product",
      "prefill": {"contact": "919255571116", "email": "amer@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
      seconds = 216000;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return datastudnets == null
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: Wid().appbar("Package"),
            drawer: DWidget().drawer(datastudnets[0] + " " + datastudnets[2],
                datastudnets[6], datastudnets[5], context, datastudnets),
            body: hasMintues <= 0
                ? ListView(
                    children: [
                      centerBox(
                          "Basic", "20 RM", "10 Hours", 36000, openCheckout1),
                      centerBox("Advanced", "50 RM", "25 hours", 90000,
                          openCheckout2),
                      centerBox(
                          "Pro", "100 RM", "60 Hours", 216000, openCheckout3),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )
                : StylingWidgets()
                    .info("You already have", "a package", context),
            bottomNavigationBar: BottomBar().bottomBar(
                context,
                datastudnets,
                datastudnets[6],
                Color(0xFF4AC8EA),
                Colors.white70,
                Colors.white70,
                Colors.white70,
                Colors.white70,
                circle(),
                null,
                null,
                null,
                null));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }

  Widget centerBox(
      String type, String price, String hours, int seconds, Function check) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
        child: Container(
          height: 300,
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        type.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Center(
                      child: Text(price.toUpperCase(),
                          style: GoogleFonts.tajawal(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[50])),
                    ),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.done_outline_sharp,
                              color: Colors.greenAccent,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(hours,
                                style: GoogleFonts.balooDa(
                                    fontSize: 20, color: Colors.grey[700])),
                            SizedBox(
                              width: 10,
                            ),
                            FaIcon(
                              FontAwesomeIcons.clock,
                              size: 18,
                              color: Colors.grey[700],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.done_outline_sharp,
                              color: Colors.greenAccent,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Choosing any tutor',
                                style: GoogleFonts.balooDa(
                                    fontSize: 20, color: Colors.grey[700])),
                            SizedBox(
                              width: 10,
                            ),
                            FaIcon(
                              FontAwesomeIcons.chalkboardTeacher,
                              size: 18,
                              color: Colors.grey[700],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.done_outline_sharp,
                              color: Colors.greenAccent,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Single Student',
                                style: GoogleFonts.balooDa(
                                    fontSize: 20, color: Colors.grey[700])),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person,
                              size: 18,
                              color: Colors.grey[700],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    child: Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FlatButton(
                            child: Text(
                              'Purchase',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: check)),
                  ),
                ),
                SizedBox(
                  height: 2,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)]),
            border: Border.all(),
          ),
        ),
      ),
    );
  }
}

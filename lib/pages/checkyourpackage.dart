import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/stylingwidget.dart';

class CheckURpackage extends StatefulWidget {
  String studentEmail;
  CheckURpackage(this.studentEmail);
  @override
  _CheckURpackageState createState() => _CheckURpackageState();
}

class _CheckURpackageState extends State<CheckURpackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Wid().appbar("Your Package"),
      body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection('packages')
              .document(widget.studentEmail)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.data.exists) {
              return StylingWidgets()
                  .info("Sorry, you do not have", "any package", context);
            }
            if (snapshot.hasData) {
              double minutes = snapshot.data["hasMintues"] / 60;

              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 200,
                        alignment: Alignment.center,
                        child: Card(
                          color: Colors.pink[100],
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("You still have",
                                    style: GoogleFonts.adventPro(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  minutes.toStringAsFixed(1).toString() +
                                      " Minutes",
                                  style: GoogleFonts.adventPro(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

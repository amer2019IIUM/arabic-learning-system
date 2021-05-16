import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/Model/teacherData.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/chat.dart';
import 'package:siginsignup/pages/studentProfile.dart';
import 'package:siginsignup/shared/appbar.dart';

class RatingsPage extends StatefulWidget {
  @override
  _RatingsPage createState() => _RatingsPage();
}

class _RatingsPage extends State<RatingsPage> {
  int _rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)])),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star)
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Center(
                  child: Text("Please evaluate your session",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Rating((rating) {
                  setState(() {
                    _rating = rating;
                  });
                }, 5),
                Center(
                  child: SizedBox(
                      height: 20,
                      child: (_rating != null && _rating != 0)
                          ? Text("", style: TextStyle(fontSize: 14))
                          : SizedBox.shrink()),
                ),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFF4AC8EA), Colors.pink[200]],
                      ),
                    ),
                    child: FlatButton(
                        child: Text(
                          "submit".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        onPressed: () async {
                          String id = await HelperFunctions.getstudentEmail();
                          String teacherID =
                              await HelperFunctions.getteacherEmail();

                          DocumentSnapshot teachData = await Firestore.instance
                              .collection("teachers")
                              .document(teacherID)
                              .get();
                          List teachDataList = teachData.data.values.toList();

                          var count = double.parse(teachDataList[15]);
                          var temp = double.parse(teachDataList[6]);
                          var stars = (temp + _rating);
                          print(stars);
                          await Firestore.instance
                              .collection("teachers")
                              .document(teacherID)
                              .updateData({
                            "countRate": (count + 1.0).toString(),
                            "stars": stars.toString()
                          });

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chat(id)));
                        }))
              ],
            ),
          ),
        ));
  }

  // passToStudnet(context) {
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => StudentProfile()));
  // }
}

class Rating extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;

  Rating(this.onRatingSelected, [this.maximumRating = 5]);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return Icon(
        Icons.star,
        color: Colors.orange,
        size: 50,
      );
    } else {
      return Icon(
        Icons.star_border_outlined,
        size: 50,
      );
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(this.widget.maximumRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });

          this.widget.onRatingSelected(_currentRating);
        },
      );
    });

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: stars,
            ),
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black54,
          ),
          child: FlatButton(
            child: Text("Clear", style: TextStyle(color: Colors.white)),
            onPressed: () {
              setState(() {
                _currentRating = 0;
              });
              this.widget.onRatingSelected(_currentRating);
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}

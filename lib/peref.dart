// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:siginsignup/pages/studentProfile.dart';
// import 'package:siginsignup/shared/appbar.dart';

// class RatingsPage extends StatefulWidget {
//   @override
//   _RatingsPage createState() => _RatingsPage();
// }

// class _RatingsPage extends State<RatingsPage> {
//   int _rating;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     colors: [Colors.blue[300], Colors.pinkAccent])),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.star),
//               Icon(Icons.star),
//               Icon(Icons.star),
//               Icon(Icons.star),
//               Icon(Icons.star)
//             ],
//           ),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Container(
//             child: ListView(
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.2,
//                 ),
//                 Center(
//                   child: Text("Please evaluate your session",
//                       style: GoogleFonts.aBeeZee(
//                           fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//                 Divider(),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Rating((rating) {
//                   setState(() {
//                     _rating = rating;
//                   });
//                 }, 5),
//                 Center(
//                   child: SizedBox(
//                       height: 20,
//                       child: (_rating != null && _rating != 0)
//                           ? Text("", style: TextStyle(fontSize: 14))
//                           : SizedBox.shrink()),
//                 ),
//                 SizedBox(height: 20),
//                 Wid().button(passToStudnet(context), "Submit")
//               ],
//             ),
//           ),
//         ));
//   }

//   passToStudnet(context) {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => StudentProfile()));
//   }
// }

// class Rating extends StatefulWidget {
//   final int maximumRating;
//   final Function(int) onRatingSelected;

//   Rating(this.onRatingSelected, [this.maximumRating = 5]);

//   @override
//   _Rating createState() => _Rating();
// }

// class _Rating extends State<Rating> {
//   int _currentRating = 0;

//   Widget _buildRatingStar(int index) {
//     if (index < _currentRating) {
//       return Icon(
//         Icons.star,
//         color: Colors.orange,
//         size: 50,
//       );
//     } else {
//       return Icon(
//         Icons.star_border_outlined,
//         size: 50,
//       );
//     }
//   }

//   Widget _buildBody() {
//     final stars = List<Widget>.generate(this.widget.maximumRating, (index) {
//       return GestureDetector(
//         child: _buildRatingStar(index),
//         onTap: () {
//           setState(() {
//             _currentRating = index + 1;
//           });

//           this.widget.onRatingSelected(_currentRating);
//         },
//       );
//     });

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: stars,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 9,
//         ),
//         Container(
//           height: 30,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.blue[300],
//           ),
//           child: FlatButton(
//             child: Text("Clear", style: TextStyle(color: Colors.white)),
//             onPressed: () {
//               setState(() {
//                 _currentRating = 0;
//               });
//               this.widget.onRatingSelected(_currentRating);
//             },
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildBody();
//   }
// }

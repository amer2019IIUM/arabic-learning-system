// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ViewTutorSchedule extends StatefulWidget {
//   @override
//   _ViewTutorScheduleState createState() => _ViewTutorScheduleState();
// }

// class _ViewTutorScheduleState extends State<ViewTutorSchedule> {
//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[300],
//         title: Text('Notification'),
//         centerTitle: true,
//       ),
//       body: Container(
//         child: StreamBuilder<QuerySnapshot>(
//           stream:
//               Firestore.instance.collection('teachersSchedule').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               return new ListView(
//                   children: snapshot.data.documents
//                       .map((DocumentSnapshot documentSnapshot) {
//                 return passId[12] == documentSnapshot.data['emailTeacher']
//                     ? Dismissible(
//                         key: ObjectKey(documentSnapshot.data),
//                         onDismissed: (direction) {
//                           documentSnapshot.reference.delete();
//                           print(documentSnapshot.data);
//                         },
//                         direction: DismissDirection.startToEnd,
//                         child: documentSnapshot.data['approved'] == 'yes'
//                             ? Container()
//                             : Card(
//                                 child: ListTile(
//                                   trailing: Wrap(
//                                     spacing: 12, // space between two icons
//                                     children: <Widget>[
//                                       ButtonTheme(
//                                         minWidth: 5.0,
//                                         height: 30.0,
//                                         child: RaisedButton(
//                                           color: Colors.green,
//                                           child: Text(
//                                             'Accept',
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                           onPressed: () {

//                                           },
//                                         ),
//                                       ),
//                                       ButtonTheme(
//                                         minWidth: 5.0,
//                                         height: 30.0,
//                                         child: RaisedButton(
//                                           color: Colors.red,
//                                           child: Text(
//                                             'Deny',
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                           onPressed: () {
//                                             // Service().denyRequest(
//                                             //     "${documentSnapshot.data['emailStudent']}${documentSnapshot.data['emailTeacher']}");
//                                             print(documentSnapshot.data);
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   // leading: ConstrainedBox(
//                                   //   constraints: BoxConstraints(
//                                   //     minWidth: 44,
//                                   //     minHeight: 44,
//                                   //     maxWidth: 44,
//                                   //     maxHeight: 44,
//                                   //   ),
//                                   //   child: Image.network(
//                                   //     documentSnapshot.data['photo'],
//                                   //     fit: BoxFit.cover,
//                                   //   ),
//                                   // ),
//                                   title: Text(
//                                     documentSnapshot.data['emailStudent']
//                                         .toString(),
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                       )
//                     : Container();
//               }).toList());
//             }
//           },
//         ),
//       ),

//     );
//   }
// }

import 'dart:io';
import 'dart:math';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:siginsignup/call/call.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/services/services.dart';

import 'package:siginsignup/studentsPages/ratingPage.dart';

class ChatStudentScreen extends StatefulWidget {
  @override
  _ChatStudentScreenState createState() => _ChatStudentScreenState();
}

class _ChatStudentScreenState extends State<ChatStudentScreen> {
  TextEditingController messageController = TextEditingController();
  final _channelController = TextEditingController();

  ClientRole _role = ClientRole.Broadcaster;
  String message;
  Stream<QuerySnapshot> chatMessagesStream;
  String sender;
  String checking;
  DocumentSnapshot lstSnap;
  List teacherData;
  List packageData;
  String itRequest;
  String chatRoomId;
  String sendBy;
  String teacherEmail;
  String studentEmail;
  var startMinutes;
  String photoUrl;
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  getDataPage() async {
    itRequest = await HelperFunctions.getitRequest();

    chatRoomId = await HelperFunctions.getchatRoomId();

    sendBy = await HelperFunctions.getsendBy();

    teacherEmail = await HelperFunctions.getteacherEmail();

    studentEmail = await HelperFunctions.getstudentEmail();

    startMinutes = await HelperFunctions.getstartMinutes();

    lstSnap = await Firestore.instance
        .collection("teachers")
        .document(teacherEmail)
        .get();
    setState(() {
      teacherData = lstSnap.data.values.toList();
    });
    Service().getMessages(chatRoomId).then((val) {
      setState(() {
        chatMessagesStream = val;
      });
    });
    lstSnap = await Firestore.instance
        .collection("packages")
        .document(studentEmail)
        .get();
    setState(() {
      packageData = lstSnap.data.values.toList();
    });
  }

  Widget chatMessages() {
    return Flexible(
      child: StreamBuilder(
        stream: chatMessagesStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return MessageTile(
                      message: snapshot.data.documents[index].data["message"],
                      sendByMe: sendBy ==
                          snapshot.data.documents[index].data["sendby"],
                      photo: snapshot.data.documents[index].data["photo"],
                      type: snapshot.data.documents[index].data["type"],
                    );
                  })
              : Container();
        },
      ),
    );
  }

  addMessage() {
    if (messageController.text.isNotEmpty) {
      Service().getConversationMessage(chatRoomId, sendBy,
          messageController.text, DateTime.now().millisecondsSinceEpoch);

      setState(() {
        messageController.text = "";
      });
    }
  }

  addMessagephoto() {
    if (photoUrl.isNotEmpty) {
      Service().getConversationMessagephoto(
          chatRoomId, sendBy, photoUrl, DateTime.now().millisecondsSinceEpoch);
    }
  }

  getTeacherData() async {}

  getMin() async {}

  @override
  void initState() {
    getDataPage();
    // getMin();

    super.initState();
  }

  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Button send image
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              child: IconButton(
                icon: Icon(Icons.image),
                onPressed: () async {
                  await Permission.photos.request();
                  var perm = await Permission.photos.status;

                  if (perm.isGranted) {
                    PickedFile pickedImage = await ImagePicker()
                        .getImage(source: ImageSource.gallery);
                    var result = File(pickedImage.path);
                    if (result != null) {
                      var snapshot = await FirebaseStorage.instance
                          .ref()
                          .child('teachers/messages/${getRandomString(5)}}')
                          .putFile(result)
                          .onComplete;
                      print(getRandomString(5));
                      String textloadingphoto;
                      textloadingphoto = await snapshot.ref.getDownloadURL();

                      setState(() {
                        photoUrl = textloadingphoto.toString();
                      });
                      addMessagephoto();
                    } else if (result == null) {
                    } else {
                      print('no image taken');
                    }
                  } else {
                    print('denied');
                  }
                },
                color: Colors.black,
              ),
            ),
            color: Colors.white,
          ),
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              child: IconButton(
                icon: Icon(Icons.face),
                onPressed: null,
                color: Colors.black,
              ),
            ),
            color: Colors.white,
          ),

          // Edit text
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                controller: messageController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),

          // Button send message
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    addMessage();
                  }),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return teacherData == null || chatMessagesStream == null
        ? Scaffold(
            body: Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)])),
              ),
              title: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70.0),
                    child: Image.network(teacherData[4],
                        width: 40, height: 40, fit: BoxFit.fill),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Mr.${teacherData[1]}".toUpperCase(),
                    style: GoogleFonts.ibmPlexSans(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              actions: [
                VerticalDivider(
                  color: Colors.white,
                ),
                IconButton(
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: onJoin),
                VerticalDivider(
                  color: Colors.white,
                ),
                IconButton(
                    icon: Icon(
                      Icons.logout,
                      size: 30,
                    ),
                    onPressed: () async {
                      DateTime beforeTime = DateTime.parse(startMinutes);
                      DateTime after = DateTime.now();

                      print('$beforeTime"/n"$after');

                      int total = packageData[0] +
                          (beforeTime.difference(after).inSeconds);
                      await Firestore.instance
                          .collection("packages")
                          .document(studentEmail)
                          .updateData({"hasMintues": total});
                      HelperFunctions.saveUserISINCHATSharedPreference(false);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RatingsPage()));
                      print(teacherEmail);
                    })
              ],
              centerTitle: true,
            ),
            //
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    chatMessages(),
                    // Container(
                    //   alignment: Alignment.bottomCenter,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: Colors.blue[100],
                    //         borderRadius: BorderRadius.circular(30)),
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    //     child: Row(
                    //       children: [
                    //         SizedBox(
                    //           width: 16,
                    //         ),
                    //         Expanded(
                    //             child: TextField(
                    //           controller: messageController,
                    //           decoration: InputDecoration(
                    //               hintText: "Message ...",
                    //               hintStyle: TextStyle(
                    //                 color: Colors.black,
                    //                 fontSize: 12,
                    //               ),
                    //               border: InputBorder.none),
                    //         )),
                    //         SizedBox(
                    //           width: 16,
                    //         ),
                    //         GestureDetector(
                    //             onTap: () {
                    //               addMessage();
                    //               print(teacherData);
                    //             },
                    //             child: Container(
                    //                 height: 40,
                    //                 width: 40,
                    //                 decoration: BoxDecoration(
                    //                     gradient: LinearGradient(
                    //                         colors: [
                    //                           Colors.blue[300],
                    //                           Colors.pinkAccent
                    //                         ],
                    //                         begin: FractionalOffset.topLeft,
                    //                         end: FractionalOffset.bottomRight),
                    //                     borderRadius:
                    //                         BorderRadius.circular(40)),
                    //                 child: Container(
                    //                     alignment: Alignment.center,
                    //                     child: Icon(
                    //                       Icons.send,
                    //                       color: Colors.white,
                    //                     )))),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    buildInput()
                  ],
                ),
              ],
            ),
          );
  }
//  Colors.pink[50]
  ///////////////Video call//////////////////////

  Future<void> onJoin() async {
    // update input validation

    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCall(
          channelName: "$itRequest",
          role: ClientRole.Broadcaster,
        ),
      ),
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final String photo;
  final int type;

  final bool sendByMe;

  MessageTile(
      {@required this.message,
      @required this.sendByMe,
      @required this.photo,
      @required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: sendByMe ? 0 : 24, right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          margin:
              sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: sendByMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(23),
                      topRight: Radius.circular(23),
                      bottomLeft: Radius.circular(23))
                  : BorderRadius.only(
                      topLeft: Radius.circular(23),
                      topRight: Radius.circular(23),
                      bottomRight: Radius.circular(23)),
              gradient: LinearGradient(
                colors: sendByMe
                    ? [Colors.blue[300], Colors.blue[300]]
                    : [Colors.pink[200], Colors.pink[200]],
              )),
          child: type == 1
              ? Container(
                  child: GestureDetector(
                    child: Center(
                      child: Hero(
                        tag: 'imageHero',
                        child: Image.network(
                          photo,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(photo);
                      }));
                    },
                  ),
                )
              : Text(message,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.tajawal(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold))),
    );
  }
}

class DetailScreen extends StatelessWidget {
  String photo;
  DetailScreen(this.photo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              photo,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

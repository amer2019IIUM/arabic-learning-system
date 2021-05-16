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
import 'package:siginsignup/services/services.dart';
import 'package:siginsignup/shared/appbar.dart';

import '../../theme.dart';

class ChatTeacherScreen extends StatefulWidget {
  String itRequest;
  String chatRoomId;
  String sendBy;
  ChatTeacherScreen(
    this.itRequest,
    this.chatRoomId,
    this.sendBy,
  );
  @override
  _ChatTeacherScreenState createState() => _ChatTeacherScreenState();
}

class _ChatTeacherScreenState extends State<ChatTeacherScreen> {
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  TextEditingController messageController = TextEditingController();
  String message;
  Stream<QuerySnapshot> chatMessagesStream;
  String sender;
  String checking;
  String photoUrl;
  final _channelController = TextEditingController();

  ClientRole _role = ClientRole.Broadcaster;

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
                      sendByMe: widget.sendBy ==
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
      Service().getConversationMessage(widget.chatRoomId, widget.sendBy,
          messageController.text, DateTime.now().millisecondsSinceEpoch);

      setState(() {
        messageController.text = "";
      });
    }
  }

  addMessagephoto() {
    if (photoUrl.isNotEmpty) {
      Service().getConversationMessagephoto(widget.chatRoomId, widget.sendBy,
          photoUrl, DateTime.now().millisecondsSinceEpoch);
    }
  }

  @override
  void initState() {
    Service().getMessages(widget.chatRoomId).then((val) {
      setState(() {
        chatMessagesStream = val;
      });
    });
    super.initState();
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
                          .child('teachers/messages/${getRandomString(5)}')
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)])),
        ),
        title: Text(
          "chat Room".toUpperCase(),
          style: GoogleFonts.ibmPlexSans(
              fontSize: 21.0, color: Colors.white, fontWeight: FontWeight.bold),
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
              //     padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
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
              //                     borderRadius: BorderRadius.circular(40)),
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
              //
              buildInput()
            ],
          ),
        ],
      ),
    );
  }
  ///////////////Video call//////////////////////

  Future<void> onJoin() async {
    // update input validation

    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCall(
          channelName: "ssffsfin",
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

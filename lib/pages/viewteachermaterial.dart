import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/shared/appbar.dart';

class ViewTeacherMaterial extends StatefulWidget {
  String teacherEmail;
  ViewTeacherMaterial(this.teacherEmail);
  @override
  _ViewTeacherMaterialState createState() => _ViewTeacherMaterialState();
}

class _ViewTeacherMaterialState extends State<ViewTeacherMaterial> {
  List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.pinkAccent,
    Colors.black,
    Colors.blue
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Wid().appbar("Tutor's Materials"),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("teachersMaterials")
            .where("email", isEqualTo: widget.teacherEmail)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          child: Icon(
                            Icons.circle,
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            final request = await Permission.storage.request();
                            if (request.isGranted) {
                              final storagePath =
                                  await getExternalStorageDirectory();

                              await FlutterDownloader.enqueue(
                                  url: snapshot.data.documents[index]["docUrl"],
                                  savedDir: storagePath.path,
                                  fileName:
                                      "${snapshot.data.documents[index]["title"]}");
                            } else {
                              print('Not permssion');
                            }
                          },
                          icon: Icon(
                            Icons.file_download,
                            size: 30,
                          ),
                        ),
                        title: Text(
                          snapshot.data.documents[index]["title"]
                              .toString()
                              .toUpperCase(),
                          style: GoogleFonts.josefinSans(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "\n${snapshot.data.documents[index]["desc"]}",
                            style: GoogleFonts.josefinSans()),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

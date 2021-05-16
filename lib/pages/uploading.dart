import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Uploading extends StatefulWidget {
  @override
  _UploadingState createState() => _UploadingState();
}

class _UploadingState extends State<Uploading> {
  File file;
  void pickercamera() async {
    final takenfile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      file = File(takenfile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploading'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  pickercamera();
                },
                color: Colors.blue,
              ),
              decoration: BoxDecoration(color: Colors.black26),
            ),
            Container(
              child:
                  file == null ? Text('Image not selected') : Image.file(file),
            )
          ],
        ),
      ),
    );
  }
}

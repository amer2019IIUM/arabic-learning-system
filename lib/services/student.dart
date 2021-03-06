import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class StudentData {
  storeNewUser(user, context) {
    Firestore.instance
        .collection('/students')
        .add({'email': user.email, 'uid': user.uid}).then((value) {
      print('printed');
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e) {
      print(e);
    });
  }
}

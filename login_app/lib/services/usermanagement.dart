import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserManagement {
  storeNewUser(user, context, name) {
    Firestore.instance.collection('/users').add(
        {'email': user.email, 'uid': user.uid, 'name': name}).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/home');
    }).catchError((e) {
      print(e);
    });
  }

  // getData() async {
  //   return await Firestore.instance.collection('/users').document();
  // }
}

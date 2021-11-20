import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future addWeight(String weight, BuildContext context) async {
  await _firestore.collection('weight').add(
      {'weight': (weight), 'createdOn': DateTime.now()}).catchError((error) {
    print(error);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Error: Please try again')));
  });
}

Future updateWeight(
    String weight, BuildContext context, var snapshotData) async {
  await _firestore.collection('weight').doc(snapshotData.id).update(
      {'weight': weight, 'createdOn': DateTime.now()}).catchError((error) {
    print(error);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Error: Please try again')));
  });
}

Future deleteWeight(var snapshotData) async {
  await _firestore.collection('weight').doc(snapshotData.id).delete();
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weight_tracker/screens/login.dart';
import 'package:flutter_weight_tracker/widgets/custom_ListView.dart';
import 'package:flutter_weight_tracker/widgets/floating_button.dart';

class HomePage extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance
      .collection('weight')
      .orderBy('createdOn', descending: true)
      .snapshots();
  final TextEditingController _controller = TextEditingController();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Weight Tracker'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) => {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => LoginScreen()))
                        });
                  },
                  child: Text('Logout')),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return listview_widget(
                  controller: _controller,
                  snapshot: snapshot,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}

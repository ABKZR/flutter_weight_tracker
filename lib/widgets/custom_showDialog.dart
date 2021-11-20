import 'package:flutter/material.dart';
import 'package:flutter_weight_tracker/firebase.dart';

// ignore: non_constant_identifier_names
Future CustomShowDialog(BuildContext context, TextEditingController weight,
    snapshotData, String text, String btnText) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Wrap(
            children: [
              TextField(
                controller: weight,
                decoration: InputDecoration(
                    hintText: 'Weight',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black26)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10)),
              ),
            ],
          ),
          title: Text(text),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: [
            TextButton(
              onPressed: () async {
                if (weight.text.isNotEmpty) {
                  btnText == 'Update'
                      ? await updateWeight(weight.text, context, snapshotData)
                      : await addWeight(weight.text, context);

                  Navigator.pop(context);
                  weight.clear();
                }
              },
              child: Text(btnText),
            ),
          ],
        );
      });
}

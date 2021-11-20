import 'package:flutter/material.dart';
import 'package:flutter_weight_tracker/widgets/custom_showDialog.dart';

// ignore: must_be_immutable
class FloatingButton extends StatelessWidget {
  final TextEditingController weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        CustomShowDialog(context, weight, '', 'Add Task', 'Add');
      },
      child: Icon(Icons.add),
    );
  }
}

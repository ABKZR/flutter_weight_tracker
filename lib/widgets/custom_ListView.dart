import 'package:flutter/material.dart';
import 'package:flutter_weight_tracker/firebase.dart';
import 'package:flutter_weight_tracker/widgets/custom_showDialog.dart';

class listview_widget extends StatelessWidget {
  const listview_widget({
    Key? key,
    required TextEditingController controller,
    required this.snapshot,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        var snapshotData = snapshot.data!.docs[index];
        return Card(
          elevation: 2,
          child: ListTile(
            title: Text(snapshotData['weight']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    onTap: () {
                      CustomShowDialog(context, _controller, snapshotData,
                          'Update Task', 'Update');
                    },
                    child: Icon(Icons.edit)),
                GestureDetector(
                  onTap: () async {
                    await deleteWeight(snapshot.data!.docs[index]);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

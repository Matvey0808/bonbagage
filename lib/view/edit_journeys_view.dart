import 'package:bonbagage/widget/dialog_editJourney_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: EditJourneysView(),
  ));
}

class EditJourneysView extends StatelessWidget {
  const EditJourneysView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Москва"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showEditJourneyDialog(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
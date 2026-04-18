import 'package:bonbagage/widget/dialog_edit_widget.dart';
import 'package:bonbagage/widget/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:bonbagage/widget/journeys_card_widget.dart';

class JourneysView extends StatelessWidget {
  const JourneysView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CardJourneys(
            title: "Москва",
            startDate: "01.01.2026",
            endDate: "10.01.2026",
          ),
          CardJourneys(
            title: "Питер",
            startDate: "10.02.2026",
            endDate: "20.02.2026",
          ),
          CardJourneys(
            title: "Казань",
            startDate: "20.03.2026",
            endDate: "30.03.2026",
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black12,
            elevation: 0,
            highlightElevation: 0,
            onPressed: () {
              journeyDialog(context);
            },
            child: const Icon(Icons.add, color: Colors.black54, size: 25),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.black12,
            elevation: 0,
            highlightElevation: 0,
            onPressed: () {
              journeyEditDialog(context);
            },
            child: Icon(Icons.edit, color: Colors.black54, size: 25),
          ),
        ],
      ),
    );
  }
}

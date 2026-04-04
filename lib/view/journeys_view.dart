import 'package:flutter/material.dart';
import 'package:bonbagage/widget/journeys_card_widget.dart';

class JourneysView extends StatelessWidget {
  const JourneysView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CardJourneys(title: "Москва", startDate: "01.01.2026", endDate: "10.01.2026"),
          CardJourneys(title: "Питер", startDate: "10.02.2026", endDate: "20.02.2026"),
          CardJourneys(title: "Казань", startDate: "20.03.2026", endDate: "30.03.2026"),
        ],
      ),
    );
  }
}

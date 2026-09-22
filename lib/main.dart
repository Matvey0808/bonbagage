import 'package:bonbagage/bloc/journeys_state.dart';
import 'package:bonbagage/view/edit_journeys_view.dart';
import 'package:bonbagage/view/journeys_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BonBagage',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/editJourney':
            final journey = settings.arguments as JourneysState;
            return MaterialPageRoute(
              builder: (context) => EditJourneysView(journey: journey),
            );
          case '/':
            return MaterialPageRoute(builder: (context) => JourneysView());
          default:
            throw Exception('not found screen');
        }
      },
    );
  }
}

import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/bloc/journeys_state.dart';
import 'package:bonbagage/view/journey_bags.dart';
import 'package:bonbagage/view/journey_edit.dart';
import 'package:bonbagage/view/journey_list.dart';
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
          case '/':
            return MaterialPageRoute(builder: (context) => JourneysList());
          case '/journey_edit':
            final args = settings.arguments as Map<String, dynamic>;
            final journey = args['journey'] as JourneysState;
            final cubit = args['cubit'] as JourneysCubit;
            return MaterialPageRoute(
              builder: (context) => JourneyEdit(journey: journey, cubit: cubit),
            );
          case '/journey_bags':
            return MaterialPageRoute(builder: (context) => JourneyBags());
          default:
            throw Exception('not found screen');
        }
      },
    );
  }
}

import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/view/journeys_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BonBagage',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => JourneysCubit(),
        child: JourneysView(),
      ),
    );
  }
}

import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/bloc/journeys_state.dart';
import 'package:bonbagage/widget/dialog_edit_journey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardJourneys extends StatelessWidget {
  const CardJourneys({super.key, required this.journey});

  final JourneysState journey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        final cubit = context.read<JourneysCubit>();
        showEditDialog(
          context,
          cubit,
          journey
        );
      },
      onDoubleTap: () {
        Navigator.pushNamed(context, '/editJourney', arguments: journey);
      },
      child: Card(
        color: Color(0xFFf2f2f2),
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              SizedBox(width: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  journey.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "${journey.startDate} - ${journey.endDate}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}

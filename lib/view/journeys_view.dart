import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/bloc/journeys_state.dart';
import 'package:bonbagage/widget/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:bonbagage/widget/journeys_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JourneysView extends StatelessWidget {
  const JourneysView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JourneysCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocBuilder<JourneysCubit, List<JourneysState>>(
              builder: (context, state) {
                if (state.isEmpty) {
                  debugPrint("Список пуст");
                }
                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final obj = state[index];
                    return CardJourneys(
                      city: obj.title,
                      startDate: obj.startDate,
                      endDate: obj.endDate,
                      id: obj.id,
                    );
                  },
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black12,
              elevation: 0,
              highlightElevation: 0,
              onPressed: () {
                final cubit = context.read<JourneysCubit>();
                showDialogAdd(context, cubit);
              },
              child: const Icon(Icons.add, color: Colors.black54, size: 25),
            ),
          );
        },
      ),
    );
  }
}

import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/bloc/journeys_state.dart';
import 'package:bonbagage/widget/bags_card_widget.dart';
import 'package:bonbagage/widget/dialog_editJourney_widget.dart';
import 'package:bonbagage/widget/dialog_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JourneyEdit extends StatelessWidget {
  const JourneyEdit({super.key, required this.journey, required this.cubit});

  final JourneysState journey;
  final JourneysCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BagsCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(journey.title),
              actions: [
                IconButton(
                  onPressed: () {
                    showDialogEdit(
                      context,
                      journey.title,
                      journey.startDate,
                      journey.endDate,
                      journey.id,
                      cubit,
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            body: BlocBuilder<BagsCubit, List<BagsState>>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final obj = state[index];
                    return BagsCardWidget(bag: obj);
                  },
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final cubit = context.read<BagsCubit>();
                showEditJourneyDialog(context, cubit);
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

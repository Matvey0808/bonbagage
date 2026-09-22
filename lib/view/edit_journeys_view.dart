import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/bloc/journeys_state.dart';
import 'package:bonbagage/widget/bags_card.dart';
import 'package:bonbagage/widget/dialog_add_edit_journey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditJourneysView extends StatelessWidget {
  const EditJourneysView({super.key, required this.journey});

  final JourneysState journey;

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
                    final cubit = context.read<BagsCubit>();
                    showAddDialogEditJourney(context, cubit);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            body: BlocBuilder<BagsCubit, List<BagsState>>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final obj = state[index];
                    return BagsCard(bag: obj);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/widget/bags_card_widget.dart';
import 'package:bonbagage/widget/dialog_editJourney_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(home: EditJourneysView()));
}

class EditJourneysView extends StatelessWidget {
  const EditJourneysView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BagsCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Москва"),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    final cubit = context.read<BagsCubit>();
                    showEditJourneyDialog(context, cubit);
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
                    return BagsCardWidget(bag: obj);
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

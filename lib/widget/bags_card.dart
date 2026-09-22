import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/widget/dialog_add_thing_edit_journey.dart';
import 'package:bonbagage/widget/dialog_edit_bags.dart';
import 'package:bonbagage/widget/dialog_edit_thing_edit_journey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagsCard extends StatelessWidget {
  const BagsCard({super.key, required this.bag});
  final BagsState bag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        final cubit = context.read<BagsCubit>();
        showEditBagsDialog(
          context: context,
          bagsName: bag.title,
          cubit: cubit,
          id: bag.id,
        );
      },
      child: Card(
        color: Color(0xFFf2f2f2),
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      bag.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final cubit = context.read<BagsCubit>();
                      showAddThingDialog(context, bag, cubit);
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              Column(
                children: bag.things.map((things) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onLongPress: () {
                              final cubit = context.read<BagsCubit>();
                              showDialogEditThing(context, cubit, bag);
                            },
                            child: Row(
                              children: [
                                Text(things.name),
                                GestureDetector(
                                  onTap: () {
                                    final cubit = context.read<BagsCubit>();
                                    cubit.deleteThings(things.id);
                                    print("id things: ${things.id}");
                                  },
                                  child: Icon(Icons.delete, size: 22),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

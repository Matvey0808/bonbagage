import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/widget/dialog_edit_bags_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagsCardWidget extends StatelessWidget {
  const BagsCardWidget({super.key, required this.bag});
  final BagsState bag;
  static List thing = ["Шорты", "Футболка", "Кепка"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        final cubit = context.read<BagsCubit>();
        showDialogEditBags(
          context: context,
          bagsName: bag.title,
          cubit: cubit,
          id: bag.id,
        );
      },
      child: Card(
        color: Color(0xFFf2f2f2),
        child: SizedBox(
          height: 120,
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
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: thing.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(thing[index]),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.delete, size: 20),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

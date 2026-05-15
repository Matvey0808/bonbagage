import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/widget/dialog_edit_bags_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagsCardWidget extends StatelessWidget {
  const BagsCardWidget({
    super.key,
    required this.bag
  });
  final BagsState bag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        final cubit = context.read<BagsCubit>();
        showDialogEditBags(context: context, bagsName: bag.title, cubit: cubit, id: bag.id);
      },
      child: Card(
        color: Color(0xFFf2f2f2),
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    bag.title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

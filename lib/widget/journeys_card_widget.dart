import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/widget/dialog_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardJourneys extends StatelessWidget {
  const CardJourneys({
    super.key,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.id
  });

  final city;
  final startDate;
  final endDate;
  final id;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTable = width >= 600;
    return GestureDetector(
      onLongPress: () {
        final cubit = context.read<JourneysCubit>();
        showDialogEdit(context, city, startDate, endDate, id, cubit);
      },
      child: Card(
        color: Color(0xFFf2f2f2),
        child: SizedBox(
          height: isTable ? width * 0.1 : width * 0.2,
          child: Row(
            children: [
              SizedBox(width: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  city,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "$startDate - $endDate",
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

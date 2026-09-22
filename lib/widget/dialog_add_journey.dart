import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/utils/helpers.dart';
import 'package:flutter/material.dart';

void showAddDialog(BuildContext context, JourneysCubit cubit) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return DialogAddJourney(cubit: cubit);
    },
  );
}

class DialogAddJourney extends StatelessWidget {
  const DialogAddJourney({super.key, required this.cubit});
  final JourneysCubit cubit;

  static final TextEditingController controllerCity = TextEditingController();
  static final TextEditingController controllerEndDate = TextEditingController();
  static final TextEditingController controllerStartDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: fields.map((element) {
          return Padding(
            padding: EdgeInsets.only(top: 5),
            child: TextField(
              controller: element['controller'],
              decoration: InputDecoration(
                focusedBorder: HelpersTextField.styleTextField,
                enabledBorder: HelpersTextField.styleTextField,
                hintText: element['hintText']
              ),
            ),
          );
        }).toList(),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Отмена",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                cubit.addJourneys(
                  controllerCity.text,
                  controllerStartDate.text,
                  controllerEndDate.text,
                );
                controllerCity.clear();
                controllerStartDate.clear();
                controllerEndDate.clear();
                Navigator.pop(context);
              },
              child: Text(
                "Добавить",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

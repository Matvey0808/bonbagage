import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:bonbagage/bloc/journeys_state.dart';
import 'package:bonbagage/utils/helpers.dart';
import 'package:flutter/material.dart';

void showEditDialog(
  BuildContext context,
  JourneysCubit cubit,
  JourneysState journey,
) {
  showDialog(
    context: context,
    builder: (editDialogContext) {
      return JourneyEditDialog(cubit: cubit, journey: journey);
    },
  );
}

class JourneyEditDialog extends StatefulWidget {
  const JourneyEditDialog({
    super.key,
    required this.cubit,
    required this.journey,
  });

  final JourneysCubit cubit;
  final JourneysState journey;

  @override
  State<JourneyEditDialog> createState() => _JourneyEditDialogState();
}

class _JourneyEditDialogState extends State<JourneyEditDialog> {
  late final TextEditingController controllerCityEdit;
  late final TextEditingController controllerStartDateEdit;
  late final TextEditingController controllerEndDateEdit;

  @override
  void initState() {
    super.initState();
    controllerCityEdit = TextEditingController(text: widget.journey.title);
    controllerStartDateEdit = TextEditingController(
      text: widget.journey.startDate,
    );
    controllerEndDateEdit = TextEditingController(text: widget.journey.endDate);
  }

  @override
  void dispose() {
    controllerCityEdit.dispose();
    controllerStartDateEdit.dispose();
    controllerEndDateEdit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fields = HelpersTextField.dataTextField(
      controllerTitle: controllerCityEdit,
      controllerEndDate: controllerStartDateEdit,
      controllerStartDate: controllerEndDateEdit,
    );

    return AlertDialog(
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                widget.cubit.deleteJourneys(widget.journey.id);
                Navigator.pop(context);
              },
              child: Text(
                "Удалить",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            SizedBox(width: 10),
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
            SizedBox(width: 10),
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                widget.cubit.updateJourneys(
                  controllerCityEdit.text,
                  controllerStartDateEdit.text,
                  controllerEndDateEdit.text,
                  widget.journey.id,
                );
                Navigator.pop(context);
              },
              child: Text(
                "Сохранить",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: fields.map((element) {
          return Padding(
            padding: EdgeInsets.only(top: 5),
            child: TextField(
              controller: element['controller'],
              decoration: InputDecoration(
                focusedBorder: HelpersTextField.styleTextField,
                enabledBorder: HelpersTextField.styleTextField,
                hintText: element['hintText'],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:flutter/material.dart';

void showDialogEdit(
  BuildContext context,
  String city,
  String startDate,
  String endDate,
  int id,
  JourneysCubit cubit
) {
  showDialog(
    context: context,
    builder: (editDialogContext) {
      return JourneyEditDialog(
        city: city,
        startDate: startDate,
        endDate: endDate,
        id: id,
        cubit: cubit,
      );
    },
  );
}

class JourneyEditDialog extends StatelessWidget {
  const JourneyEditDialog({
    super.key,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.id,
    required this.cubit
  });

  final JourneysCubit cubit;

  final String city;
  final String startDate;
  final String endDate;
  final int id;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerCityEdit = TextEditingController(
      text: city,
    );
    final TextEditingController _controllerStartDateEdit =
        TextEditingController(text: startDate);
    final TextEditingController _controllerEndDateEdit = TextEditingController(
      text: endDate,
    );

    final BorderRadius border = BorderRadius.all(Radius.circular(12));
    final BorderSide borderSide = BorderSide(width: 3, color: Colors.black26);
    final TextStyle textStyleHintText = TextStyle(
      fontSize: 16,
      color: Colors.black54,
    );

    final focusedBorderTextField = OutlineInputBorder(
      borderRadius: border,
      borderSide: borderSide,
    );

    final enableBorderTextField = OutlineInputBorder(
      borderRadius: border,
      borderSide: borderSide,
    );

    final elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: border),
      padding: EdgeInsets.only(left: 10, right: 10),
    );

    return AlertDialog(
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: () {
                cubit.deleteJourneys(id);
                Navigator.pop(context);
              },
              child: Text(
                "Удалить",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              style: elevatedButtonStyle,
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
              style: elevatedButtonStyle,
              onPressed: () {
                cubit.updateJourneys(
                  _controllerCityEdit.text,
                  _controllerStartDateEdit.text,
                  _controllerEndDateEdit.text,
                  id
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
        children: [
          TextField(
            controller: _controllerCityEdit,
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              hintText: "City",
              hintStyle: textStyleHintText,
              focusedBorder: focusedBorderTextField,
              enabledBorder: enableBorderTextField,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controllerStartDateEdit,
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              hintText: "start date",
              hintStyle: textStyleHintText,
              focusedBorder: focusedBorderTextField,
              enabledBorder: enableBorderTextField,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controllerEndDateEdit,
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              hintText: "end date",
              hintStyle: textStyleHintText,
              focusedBorder: focusedBorderTextField,
              enabledBorder: enableBorderTextField,
            ),
          ),
        ],
      ),
    );
  }
}

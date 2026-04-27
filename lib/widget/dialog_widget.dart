import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:flutter/material.dart';

void showDialogAdd(BuildContext context, JourneysCubit cubit) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return JourneyDialogAdd(cubit: cubit);
    },
  );
}

class JourneyDialogAdd extends StatelessWidget {
  const JourneyDialogAdd({super.key, required this.cubit});
  final JourneysCubit cubit;

  @override
  Widget build(BuildContext context) {
    BorderRadius border = BorderRadius.all(Radius.circular(12));
    BorderSide borderSide = BorderSide(width: 3, color: Colors.black26);

    final TextEditingController _controllerCity = TextEditingController();

    final TextEditingController _controllerEndDate = TextEditingController();

    final TextEditingController _controllerStartDate = TextEditingController();

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
    );

    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controllerCity,
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              hintText: "City",
              focusedBorder: focusedBorderTextField,
              enabledBorder: enableBorderTextField,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controllerStartDate,
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              hintText: "start date",
              focusedBorder: focusedBorderTextField,
              enabledBorder: enableBorderTextField,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controllerEndDate,
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              hintText: "end date",
              focusedBorder: focusedBorderTextField,
              enabledBorder: enableBorderTextField,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: () {
                cubit.addJourneys(
                  _controllerCity.text,
                  _controllerStartDate.text,
                  _controllerEndDate.text,
                );
                _controllerCity.clear();
                _controllerStartDate.clear();
                _controllerEndDate.clear();
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

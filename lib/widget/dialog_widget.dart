import 'package:bonbagage/bloc/journeys_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void journeyDialog(BuildContext context) {
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerEndDate = TextEditingController();
  final TextEditingController _controllerStartDate = TextEditingController();

  const BorderRadius border = BorderRadius.all(Radius.circular(12));

  final textFieldDecoration = InputDecoration(
    hintText: "start date",
    hintStyle: TextStyle(fontSize: 16, color: Colors.black54),
    focusedBorder: OutlineInputBorder(
      borderRadius: border,
      borderSide: BorderSide(width: 2, color: Colors.black26),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: border,
      borderSide: BorderSide(width: 3, color: Colors.black26),
    ),
  );

  final elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black12,
    shape: RoundedRectangleBorder(borderRadius: border),
  );

  showDialog(
    context: context,
    builder: (dialogContext) => BlocProvider.value(
      value: context.read<JourneysCubit>(),
      child: AlertDialog(
        actions: <Widget>[
          SizedBox(height: 10),
          TextField(
            controller: _controllerCity,
            cursorColor: Colors.black26,
            decoration: textFieldDecoration,
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controllerStartDate,
            cursorColor: Colors.black26,
            decoration: textFieldDecoration,
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controllerEndDate,
            cursorColor: Colors.black26,
            decoration: textFieldDecoration,
          ),
          SizedBox(height: 10),
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
                  context.read<JourneysCubit>().addJourneys(
                    _controllerCity.text,
                    _controllerStartDate.text,
                    _controllerEndDate.text,
                  );
                  _controllerCity.clear();
                  _controllerStartDate.clear();
                  _controllerEndDate.clear();
                },
                child: Text(
                  "Добавить",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

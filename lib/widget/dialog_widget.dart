import 'package:flutter/material.dart';

void journeyDialog(BuildContext context) {
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
    builder: (BuildContext context) => AlertDialog(
      actions: <Widget>[
        SizedBox(height: 10),
        TextField(cursorColor: Colors.black26, decoration: textFieldDecoration),
        SizedBox(height: 10),
        TextField(cursorColor: Colors.black26, decoration: textFieldDecoration),
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
              onPressed: () {},
              child: Text(
                "Добавить",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

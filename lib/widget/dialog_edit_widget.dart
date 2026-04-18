import 'package:flutter/material.dart';

void journeyEditDialog(BuildContext context) {
  const BorderRadius border = BorderRadius.all(Radius.circular(12));
  const BorderSide borderSide = BorderSide(width: 3, color: Colors.black26);
  const TextStyle textStyleHintText = TextStyle(
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

  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: () {},
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
              onPressed: () {},
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
            cursorColor: Colors.black26,
            decoration: InputDecoration(
              hintText: "Название",
              hintStyle: textStyleHintText,
              focusedBorder: focusedBorderTextField,
              enabledBorder: enableBorderTextField,
            ),
          ),
          SizedBox(height: 10),
          TextField(
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
    ),
  );
}

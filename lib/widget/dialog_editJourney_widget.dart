import 'package:flutter/material.dart';

void showEditJourneyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return DialogEditjourneyWidget();
    },
  );
}

class DialogEditjourneyWidget extends StatelessWidget {
  const DialogEditjourneyWidget({super.key});

  static const BorderRadius border = BorderRadius.all(Radius.circular(12));
  static const BorderSide borderSide = BorderSide(
    width: 3,
    color: Colors.black26,
  );

  static final elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black12,
    shape: RoundedRectangleBorder(borderRadius: border),
  );

  static final focusedBorderTextField = OutlineInputBorder(
    borderRadius: border,
    borderSide: borderSide,
  );

  static final enableBorderTextField = OutlineInputBorder(
    borderRadius: border,
    borderSide: borderSide,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        cursorColor: Colors.black26,
        decoration: InputDecoration(
          focusedBorder: focusedBorderTextField,
          enabledBorder: enableBorderTextField,
        ),
      ),
      actions: [
        ElevatedButton(
          style: elevatedButtonStyle,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Отмена",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
        ElevatedButton(
          style: elevatedButtonStyle,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Добавить",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

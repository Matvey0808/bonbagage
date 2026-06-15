import 'package:bonbagage/bloc/bags_state.dart';
import 'package:flutter/material.dart';

void showDialogAddThing(BuildContext context, BagsState bags) {
  showDialog(
    context: context,
    builder: (thingContext) {
      return DialogAddThing(bags: bags);
    },
  );
}

class DialogAddThing extends StatelessWidget {
  const DialogAddThing({super.key, required this.bags});

  final BagsState bags;

  @override
  Widget build(BuildContext context) {
    final BorderRadius border = BorderRadius.all(Radius.circular(12));
    final BorderSide borderSide = BorderSide(width: 3, color: Colors.black26);

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Добавить в ${bags.title}",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Thing...",
                focusedBorder: focusedBorderTextField,
                enabledBorder: enableBorderTextField
              ),
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
        ),
      ],
    );
  }
}

import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:flutter/material.dart';

void showDialogThings(BuildContext context, BagsCubit cubit) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return DialogThings(cubit: cubit);
    },
  );
}

class DialogThings extends StatelessWidget {
  const DialogThings({super.key, required this.cubit});

  final BagsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerThings = TextEditingController();
    int idThings = 0;
    
    final BorderRadius border = BorderRadius.all(Radius.circular(12));
    final BorderSide borderSide = BorderSide(width: 3, color: Colors.black26);

    final elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: border),
      padding: EdgeInsets.only(left: 10, right: 10),
    );

    final textFieldStyle = OutlineInputBorder(
      borderRadius: border,
      borderSide: borderSide,
    );

    return AlertDialog(
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: () {
                Navigator.pop(context);
                _controllerThings.clear();
              },
              child: Text(
                "Отмена",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: () {
                cubit.addThingInList(_controllerThings.text, idThings++);
                Navigator.pop(context);
                _controllerThings.clear();
              },
              child: Text(
                "Добавить",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ],
      content: TextField(
        controller: _controllerThings,
        decoration: InputDecoration(
          hintText: "Thing...",
          enabledBorder: textFieldStyle,
          focusedBorder: textFieldStyle,
        ),
      ),
    );
  }
}

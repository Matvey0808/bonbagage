import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:flutter/material.dart';

void showDialogEditBags({
  required BuildContext context,
  required String bagsName,
  required BagsCubit cubit,
  required int id
  }) {
    
  showDialog(
    context: context,
    builder: (bagsContext) {
      return DialogEditBagsWidget(bagsName: bagsName, id: id, cubit: cubit);
    },
  );
}

class DialogEditBagsWidget extends StatelessWidget {
  const DialogEditBagsWidget({
    super.key,
    required this.bagsName,
    required this.id,
    required this.cubit,
  });

  final String bagsName;
  final int id;
  final BagsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerBags = TextEditingController(
      text: bagsName,
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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controllerBags,
            decoration: InputDecoration(
              hintStyle: textStyleHintText,
              focusedBorder: focusedBorderTextField,
              enabledBorder: enableBorderTextField,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: () {
                cubit.deleteBags(id);
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
                cubit.updateBags(
                  _controllerBags.text,
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
    );
  }
}

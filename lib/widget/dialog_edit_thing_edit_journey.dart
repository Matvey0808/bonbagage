import 'package:bonbagage/bloc/bags_cubit.dart';
import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/utils/helpers.dart';
import 'package:flutter/material.dart';

void showDialogEditThing(
  BuildContext context,
  BagsCubit cubit,
  BagsState bag
) {
  showDialog(
    context: context,
    builder: (context) {
      return DialogEditThingEditJourney(cubit: cubit, bag: bag);
    },
  );
}

class DialogEditThingEditJourney extends StatefulWidget {
  const DialogEditThingEditJourney({
    super.key,
    required this.cubit,
    required this.bag
  });

  final BagsCubit cubit;
  final BagsState bag;

  @override
  State<DialogEditThingEditJourney> createState() => _DialogEditThingEditJourneyState();
}

class _DialogEditThingEditJourneyState extends State<DialogEditThingEditJourney> {
  late final TextEditingController controllerThing;

  @override
  void initState() {
    super.initState();
    controllerThing = TextEditingController(text: widget.bag.title);
  }

  @override
  void dispose() {
    controllerThing.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controllerThing,
        decoration: InputDecoration(
          hintText: "Thing...",
          enabledBorder: HelpersTextField.styleTextField,
          focusedBorder: HelpersTextField.styleTextField,
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () => Navigator.pop(context),
              child: Text("Отмена", style: TextStyle(fontSize: 14, color: Colors.black54)),
            ),
            ElevatedButton(
              style: HelpersElevatedButton.elevatedButtonStyle,
              onPressed: () {
                widget.cubit.editThing(controllerThing.text, widget.bag.id);
                Navigator.pop(context);
              },
              child: Text("Сохранить", style: TextStyle(fontSize: 14, color: Colors.black54)),
            ),
          ],
        ),
      ],
    );
  }
}

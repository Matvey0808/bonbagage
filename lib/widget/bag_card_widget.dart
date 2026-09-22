import 'package:flutter/material.dart';

class BagCardWidget extends StatefulWidget {
  const BagCardWidget({super.key, required this.thing, required this.items});

  final String thing;
  final List items;

  @override
  State<BagCardWidget> createState() => _BagCardWidgetState();
}

class _BagCardWidgetState extends State<BagCardWidget> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFf2f2f2),
      child: SizedBox(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.thing,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Column(
              children: widget.items.map((list) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(list, style: TextStyle(fontSize: 16)),
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

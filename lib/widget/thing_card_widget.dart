import 'package:flutter/material.dart';

class BagCardWidget extends StatelessWidget {
  const BagCardWidget({super.key, required this.thing});

  final String thing;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xFFf2f2f2),
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              thing,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
      );
  }
}
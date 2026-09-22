import 'package:bonbagage/widget/thing_card_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const BagsView()));
}

class BagsView extends StatelessWidget {
  const BagsView({super.key});

  @override
  Widget build(BuildContext context) {
    final things = [
      "Чемодан",
      "Рюкзак",
      "Пакет"
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: things.length,
          itemBuilder: (context, index) {
            final obj = things[index];
            return BagCardWidget(thing: obj);
          },
        )
      ),
    );
  }
}
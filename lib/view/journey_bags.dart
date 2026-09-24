import 'package:bonbagage/widget/bag_card_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const JourneyBags()));
}

class JourneyBags extends StatelessWidget {
  const JourneyBags({super.key});

  @override
  Widget build(BuildContext context) {
    final things = [
      "Чемодан",
      "Рюкзак",
      "Пакет"
    ];

    final items = [
      ["Рубашка", "Брюки", "Футболка"],
      ["Ноутбук", "Планшет"],
      ["Кроссовки"]
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: things.length,
          itemBuilder: (context, index) {
            final obj = things[index];
            return BagCardWidget(thing: obj, items: items[index]);
          },
        )
      ),
    );
  }
}
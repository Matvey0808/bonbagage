import 'package:bonbagage/model/things_model.dart';

class BagsState {
  final int id;
  final String title;
  final List<Thing> things;

  BagsState({
    required this.id,
    required this.title,
    required this.things
  });

  BagsState copyWith({
    int? id,
    String? title,
    List<Thing>? things
  }) {
    return BagsState(
      id: id ?? this.id,
      title: title ?? this.title,
      things: things ?? this.things
    );
  }
}
import 'package:bonbagage/model/things_model.dart';

class BagsState {
  final int id;
  final String title;
  final List<Thing> things;

  BagsState({
    required this.id,
    required this.title,
    List<Thing>? things
  }) : things = things ?? [];

  BagsState copyWith({
    int? id,
    String? title
  }) {
    return BagsState(
      id: id ?? this.id,
      title: title ?? this.title
    );
  }
}
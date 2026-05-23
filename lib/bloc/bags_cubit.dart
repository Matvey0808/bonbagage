import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/model/things_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagsCubit extends Cubit<List<BagsState>> {
  BagsCubit() : super([]);

  int idCounter = 0;

  void addBags(String title) {
    final newBags = BagsState(
      id: idCounter++,
      title: title,
      things: []
    );

    emit([...state, newBags]);
  }

  void updateBags(String title, int id) {
    final update = state.map((items) {
      if (items.id == id) {
        return items.copyWith(
          title: title,
          id: id
        );
      } else {
        return items;
      }
    }).toList();

    emit(update);
  }

  void deleteBags(int id) {
    final List<BagsState> delete = List.from(state);
    delete.removeWhere((bags) => bags.id == id);

    emit(delete);
  }

  void deleteThings(int id) {
    final List<BagsState> delete = state.map((bag) {
      if (bag.things.any((things) => things.id == id)) {
        List<Thing> deleteThing = List.from((bag.things)..removeWhere((things) => things.id == id));
        return bag.copyWith(
          things: deleteThing,
        );
      } else {
        return bag;
      }
    }).toList();
    emit(delete);
  }
}

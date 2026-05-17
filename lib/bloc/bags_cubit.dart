import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/model/things_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagsCubit extends Cubit<List<BagsState>> {
  BagsCubit() : super([]);

  int idCounter = 0;

  void addBags(String title) {
    final newBags = BagsState(
      id: idCounter++,
      title: title
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

  void addThingInList(List<Thing> things, String title) {
    final newThings = BagsState(
      id: idCounter,
      title: title,
      things: things
    );

    emit([newThings]);
  }
}
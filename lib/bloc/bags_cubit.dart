import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/model/things_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagsCubit extends Cubit<List<BagsState>> {
  BagsCubit()
    : super([
        BagsState(
          id: 0,
          title: "Рюкзак",
          things: [
            Thing(id: 1, name: "ноутбук"),
            Thing(id: 2, name: "зарядка"),
            Thing(id: 3, name: "блокнот"),
            Thing(id: 4, name: "ручка"),
            Thing(id: 5, name: "мышка"),
            Thing(id: 6, name: "провода"),
          ],
        ),
        BagsState(
          id: 1,
          title: "Сумка",
          things: [
            Thing(id: 7, name: "штаны синие"),
            Thing(id: 8, name: "футболка белая"),
            Thing(id: 9, name: "футболка синяя"),
            Thing(id: 10, name: "рубашка зеленая"),
          ],
        ),
        BagsState(
          id: 2,
          title: "Умывалка",
          things: [
            Thing(id: 11, name: "зубная щетка"),
            Thing(id: 12, name: "зубная паста"),
            Thing(id: 13, name: "дезодорант"),
            Thing(id: 14, name: "одеколон"),
          ],
        ),
      ]);

  int idCounter = 3;

  void addBags(String title) {
    final newBags = BagsState(id: idCounter++, title: title, things: []);

    emit([...state, newBags]);
  }

  void updateBags(String title, int id) {
    final update = state.map((items) {
      if (items.id == id) {
        return items.copyWith(title: title, id: id);
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
      if (bag.things.any((thing) => thing.id == id)) {
        final deleteThing = bag.things
            .where((things) => things.id != id)
            .toList();
        return bag.copyWith(things: deleteThing);
      }
      {
        return bag;
      }
    }).toList();

    if (delete != state) {
      emit(delete);
    }
  }

  void addThingInList(String title, int id) {
    final addThing = state.map((thing) {
      if (thing.id == id) {
        final thingsList = Thing(
          id: DateTime.now().millisecondsSinceEpoch,
          name: title,
        );
        final List<Thing> updateList = List.from(thing.things)..add(thingsList);
        final copyThing = thing.copyWith(things: updateList);
        return copyThing;
      } else {
        return thing;
      }
    }).toList();
    emit(addThing);
  }

  void editThing(String title, int id) {
    final update = state.map((bag) {
      if (bag.things.any((thing) => thing.id == id)) {
        final List<Thing> editThing = bag.things.map((thing) {
          if (thing.id == id) {
            return thing.copyWith(name: title);
          } else {
            return thing;
          }
        }).toList();
        return bag.copyWith(things: editThing);
      } else {
        return bag;
      }
    }).toList();
    emit(update);
  }
}

import 'package:bonbagage/bloc/bags_state.dart';
import 'package:bonbagage/model/things_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagsCubit extends Cubit<List<BagsState>> {
  BagsCubit() : super([]);

  int idCounter = 0;
  int idThings = 0;

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

  void addThingInList(String title, List<Thing> thing, int id) {
    // Первое что я попробовал.
    final update = state.map((things) {
      return things.copyWith(
        id: idThings,
        title: title,
        things: thing
      );
    }).toList();
    emit(update);

    // Второе, это я подсмотрел у кого-то в репозитории, но как работает не понял и реализовал я ее неправильно наверное.
    final updateThings = List<Thing>.from(state)..addAll(thing);
    // не помню как я эмитил
    emit([]);
    // я многое что пробовал, но это то, что я вспомнил, остальное забыл.
    /*
    Там вообще в 3-ем решении сначала должен копировать Bags список
    Потом его обновляем когда добавляем элемент Thing в Bags
    Там что-то через from я делал и copyWith.

    Я не понимаю как каждому элементу присвоить id как у Bags, типо в списке Bags мы должны еще удалять
    элементы в списке Things, это как?
    Может я решения легкого не нашел и все усложняю
    */
  }
}
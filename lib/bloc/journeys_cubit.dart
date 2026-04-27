import 'package:bloc/bloc.dart';
import 'package:bonbagage/bloc/journeys_state.dart';

class JourneysCubit extends Cubit<List<JourneysState>> {
  JourneysCubit()
    : super([
        JourneysState(
          title: "Москва",
          startDate: "01.01.2026",
          endDate: "10.01.2026",
          id: 0,
        ),
        JourneysState(
          title: "Питер",
          startDate: "10.02.2026",
          endDate: "20.02.2026",
          id: 1,
        ),
        JourneysState(
          title: "Казань",
          startDate: "20.03.2026",
          endDate: "30.03.2026",
          id: 2,
        ),
      ]);

  int idCounter = 3;

  void addJourneys(String title, String startDate, String endDate) {
    final newJourneys = JourneysState(
      title: title,
      startDate: startDate,
      endDate: endDate,
      id: idCounter,
    );

    emit([...state, newJourneys]);
  }

  void updateJourneys(String title, String startDate, String endDate, int id) {
    final update = state.map((items) {
      if (items.id == id) {
        return items.copyWith(
          title: title,
          startDate: startDate,
          endDate: endDate,
        );
      } else {
        return items;
      }
    }).toList();

    emit(update);
  }

  void deleteJourneys(int id) {
    final List<JourneysState> delete = List.from(state);
    delete.removeWhere((journeys) => journeys.id == id);

    emit(delete);
  }
}

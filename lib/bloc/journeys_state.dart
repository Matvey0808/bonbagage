class JourneysState {
  final String title;
  final String startDate;
  final String endDate;
  final int id;

  JourneysState({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.id
  });

  JourneysState copyWith({
    String? title,
    String? startDate,
    String? endDate,
    int? id
  }) {
    return JourneysState(
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      id: id ?? this.id
    );
  }
}
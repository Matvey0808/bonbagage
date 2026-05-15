class BagsState {
  final int id;
  final String title;

  BagsState({
    required this.id,
    required this.title
  });

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
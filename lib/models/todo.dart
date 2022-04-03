class Todo {
  final int id;
  final String title;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;

  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });
}

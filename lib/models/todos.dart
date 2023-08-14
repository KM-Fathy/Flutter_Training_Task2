class Todos {
  int id;
  String todo;
  bool completed;
  int userId;

  Todos({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }
}

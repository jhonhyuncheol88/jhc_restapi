class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo(
      {this.userId = 0,
      this.id = 0,
      this.title = '로딩중..',
      this.completed = false});

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }
}

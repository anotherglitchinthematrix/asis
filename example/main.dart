import 'package:http/http.dart' as http;
import 'package:asis/asis.dart';

class Task {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  // Task({this.userId, this.id, this.title, this.completed});

  Task.fromJson(Map<String, dynamic> e)
      : userId = e['userId'],
        id = e['id'],
        title = e['title'],
        completed = e['completed'];

  /// Static method to pass the handler directly to the input.
  static Task handler(Map<String, dynamic> e) {
    return Task.fromJson(e);
  }
}

/// Resource url.
var url = 'http://jsonplaceholder.typicode.com/todos';

/// Returns a task object.
Future<Task> task(int id) => http.get(Uri.parse('$url/$id')).as(Task.handler);

/// Returns a list of tasks.
Future<List<Task>> get tasks => http.get(Uri.parse(url)).asList(Task.handler);

void main() async {
  /// Get the third task and print the title.
  task(1)
      .then((e) => e.title)
      .then((e) => 'Title of the first task: $e')
      .then(print);

  /// Print the title of the top 3 task.
  tasks.take(3).each((e) => print(e.title));

  /// Count of the completed tasks.
  tasks
      .where((e) => e.completed)
      .fold<int>(0, (p, _) => p + 1)
      .then((e) => 'Number of the completed tasks: $e')
      .then(print);
}

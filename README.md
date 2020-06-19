![Dart CI](https://github.com/anotherglitchinthematrix/asis/workflows/Dart%20CI/badge.svg?branch=master)
# ASIS 

A small utility library to handle JSON encoded http responses easily, transforms the response into an internal type of data and extends the capabilities of `Response`, `Iterable`, `List`, `Future<Response>`, `Future<Iterable>`, `Future<List>` to handle data manipulation on the same future chain.

## Getting Started

This package built upon the [http](https://pub.dev/packages/http) package to work with it's internal [Response](https://pub.dev/documentation/http/latest/http/Response-class.html) type.

It's also possible to use some of the internal features without depending to [http](https://pub.dev/packages/http) package, such as the extensions, `Future<List<T>>`, `Future<Iterable<T>>`,  that helps to manipulate the data on the same future chain.

## Example
Here is a working example that shows the brief functionality of the library, this example highlights how to transform the JSON encoded HTTP body to an internal custom object and a list of that custom object on top of some data manipulation without leaving the same future chain that get's the data from the http call.

```dart
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
Future<Task> task(int id) => http.get('$url/$id').as(Task.handler);

/// Returns a list of tasks.
Future<List<Task>> get tasks => http.get(url).asList(Task.handler);

void main() async {
  /// Get the third task and print the title.
  task(3)
      .then((e) => e.title)
      .then((e) => 'Title of the third task: $e')
      .then(print);

  /// Print the title of the top 3 task.
  tasks.take(3).each((e) => print(e.title));

  /// Count of the completed tasks.
  tasks
      .where((e) => e.completed)
      .fold(0, (p, _) => p + 1)
      .then((e) => 'Number of the completed tasks: $e')
      .then(print);
}
```

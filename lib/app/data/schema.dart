import 'package:isar/isar.dart';

part 'schema.g.dart';

@collection
class Tasks {
  Id id;
  String title;
  String description;
  int taskColor;
  bool archive;

  @Backlink(to: 'task')
  final todos = IsarLinks<Todos>();

  Tasks({
    this.id = Isar.autoIncrement,
    required this.title,
    this.description = '',
    this.archive = false,
    required this.taskColor,
  });

  Tasks.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'] ?? '',
        taskColor = json['taskColor'],
        archive = json['archive'] ?? false;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': title,
        'description': description,
        'todoCompletedTime': taskColor,
        'done': archive,
      };
}

@collection
class Todos {
  Id id;
  String name;
  String description;
  String question1;
  String question2;
  String question3;
  String question4;
  String question5;
  DateTime? todoCompletedTime;
  bool done;

  final task = IsarLink<Tasks>();

  Todos({
    this.id = Isar.autoIncrement,
    required this.name,
    this.description = '',
    this.question1='',
    this.question2='',
    this.question3='',
    this.question4='',
    this.question5='',
    this.todoCompletedTime,
    this.done = false,
  });

  Todos.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'] ?? '',
        question1=json['question1'],
        question2=json['question2'],
        question3=json['question3'],
        question4=json['question4'],
        question5=json['question5'],
        todoCompletedTime = json['todoCompletedTime'],
        done = json['done'] ?? false;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'question1': question1,
    'question2': question2,
    'question3': question3,
    'question4': question4,
    'question5': question5,
        'todoCompletedTime': todoCompletedTime,
        'done': done,
      };
}

@collection
class Settings {
  Id id = Isar.autoIncrement;
  bool onboard = false;
  bool? theme;
}

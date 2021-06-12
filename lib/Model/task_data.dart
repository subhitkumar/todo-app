import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:to_do_list/Model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _task = [Task(name: "buy milk"), Task(name: "buy eggs")];

  UnmodifiableListView<Task> get task {
    return UnmodifiableListView(_task);
  }

  int get taskCount {
    return _task.length;
  }

  void addTask(String taskTitle) {
    final newTask = Task(name: taskTitle);
    _task.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();

    notifyListeners();
  }

  void deleteTask(Task task) {
    _task.remove(task);
    notifyListeners();
  }

  bool _darkTheme = true;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }
}

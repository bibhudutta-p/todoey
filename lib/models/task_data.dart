import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _allTasks = [
    Task(name: 'name 1'),
    Task(name: 'name 2'),
    Task(name: 'name 3'),
  ];
  UnmodifiableListView<Task> get allTasks {
    return UnmodifiableListView(_allTasks);
  }

  int get taskCount => _allTasks.length;
  void addNewTask(String taskTitle) {
    _allTasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _allTasks.remove(task);
    notifyListeners();
  }
}

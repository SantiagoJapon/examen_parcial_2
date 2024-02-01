import 'package:flutter/material.dart';
import 'package:examen_parcial_2/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:examen_parcial_2/providers/task_provider.dart';


class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskDone(String id) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex].isDone = !_tasks[taskIndex].isDone;
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}

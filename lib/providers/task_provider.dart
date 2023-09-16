import 'package:flutter/material.dart';
import 'package:trashfix_assignment/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _tasks;

  TaskModel createTask({required String title, required String description}) {
    final TaskModel task = TaskModel(
      title: title,
      description: description,
      createdAt: DateTime.now(),
      isCompleted: false,
    );
    return task;
  }

  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  TaskModel markTaskComplete(int index) {
    TaskModel task = _tasks[index];
    _tasks[index].isCompleted = true;
    _tasks[index].completedAt = DateTime.now();

    removeTask(index);
    return task;
  }
}

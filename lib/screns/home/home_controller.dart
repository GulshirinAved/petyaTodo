import 'dart:convert';
import 'dart:core';
import 'package:get/get.dart';
import 'package:petya/model/task.dart';
import 'package:petya/screns/completed_task/completed_task_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  RxList<Task> todo = <Task>[].obs;
  RxList<Task> completedTask = <Task>[].obs;
  void addNewTask(Task newTask) {
    todo.add(newTask);
    print('it is addnew ${todo}');
    saveTasks();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskJson = jsonEncode(todo.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', taskJson);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskJson = prefs.getString('tasks');
    if (taskJson != null) {
      final List<dynamic> tasksList = jsonDecode(taskJson);
      todo.addAll(tasksList.map((task) => Task.fromJson(task)).toList());
    }
  }

  void onChanged(Task task) {
    task.isCompleted = !task.isCompleted;
    completedTask.assignAll(todo.where((t) => t.isCompleted).toList());

    todo.refresh();

    saveTasks();
  }

  void deleteTask(Task task) {
    todo.remove(task);
    saveTasks();
  }
}

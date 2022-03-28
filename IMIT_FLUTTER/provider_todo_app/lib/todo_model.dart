import 'package:flutter/cupertino.dart';
import 'package:provider_todo_app/task_model.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addTaskList() {
    TaskModel taskModel = TaskModel("title ${taskList.length}",
        "this is the task no detail ${taskList.length}");

    taskList.add(taskModel);

    notifyListeners();
  }
}

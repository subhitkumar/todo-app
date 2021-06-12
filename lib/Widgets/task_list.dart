import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Model/task_data.dart';
import 'package:to_do_list/Widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.task[index].name,
              isChecked: taskData.task[index].isDone,
              checkBoxCallBack: (checkBoxState) {
                taskData.updateTask(taskData.task[index]);
              },
              longPressCallBack: () {
                taskData.deleteTask(taskData.task[index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

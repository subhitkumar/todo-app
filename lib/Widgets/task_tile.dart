import 'package:flutter/material.dart';
import 'package:to_do_list/my_flutter_app_icons.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final Function longPressCallBack;
  TaskTile(
      {this.isChecked = false,
      this.taskTitle,
      this.checkBoxCallBack,
      this.longPressCallBack});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            fontSize: 18,
            decoration: isChecked ? TextDecoration.lineThrough : null,
            color: isChecked ? Colors.grey : Colors.black),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
              activeColor: Colors.lightBlueAccent,
              value: isChecked,
              onChanged: checkBoxCallBack),
          IconButton(
              icon: Icon(
                MyFlutterApp.trash_empty,
                color: Colors.redAccent,
              ),
              onPressed: longPressCallBack)
        ],
      ),
    );
  }
}

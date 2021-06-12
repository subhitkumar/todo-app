import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Model/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskData>(context);
    String taskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: task.darkTheme ? Color(0xffb0003a) : Color(0xff373737),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text("Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white)),
          TextField(
            style: TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            cursorColor: Colors.white,
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              taskTitle = newText;
            },
          ),
          TextButton(
            child: Text(
              "Add",
              style: TextStyle(
                  color: task.darkTheme ? Colors.black : Colors.white),
            ),
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTask(taskTitle);
              Navigator.pop(context);
            },
            style: ButtonStyle(
                backgroundColor: task.darkTheme
                    ? MaterialStateProperty.all<Color>(Color(0xffffffff))
                    : MaterialStateProperty.all<Color>(Color(0xff62727b))),
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Model/task_data.dart';
import 'package:to_do_list/Widgets/task_list.dart';
import 'package:to_do_list/Screens/add_task_screen.dart';
import 'package:to_do_list/my_flutter_app_icons.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskData>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: task.darkTheme ? Color(0xffb0003a) : Color(0xff373737),
        child: Icon(Icons.add),
      ),
      backgroundColor: task.darkTheme ? Color(0xffb0003a) : Color(0xff373737),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: IconButton(
                    icon: task.darkTheme
                        ? Icon(
                            MyFlutterApp.sun,
                            color: Color(0xffb0003a),
                          )
                        : Icon(MyFlutterApp.moon, color: Color(0xff373737)),
                    onPressed: () {
                      task.darkTheme = !task.darkTheme;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "ToDoIt",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    )
                  ],
                ),
                Text(
                  '${task.taskCount} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xfff5f5f5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}

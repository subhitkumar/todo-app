import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Model/task_data.dart';
import 'package:to_do_list/Screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

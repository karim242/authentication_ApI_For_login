import 'package:flutter/material.dart';
import 'package:login_page/component/reusableComponent.dart';
import 'package:login_page/component/constance.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:(context, index)=>buildTasksItems(tasks[index]),
      separatorBuilder: (context,index)=>Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[700],
      ),
      itemCount: tasks.length,
    );
  }
}

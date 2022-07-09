import 'package:flutter/material.dart';
import '/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, i) {
            return TaskTile(
              longPress: () {
                Provider.of<TaskData>(context, listen: false).deleteTask(
                    Provider.of<TaskData>(context, listen: false).allTasks[i]);
              },
              taskTitle: Provider.of<TaskData>(context).allTasks[i].name,
              isChecked: Provider.of<TaskData>(context).allTasks[i].isDone,
              checkboxCallback: (checkBoxState) {
                Provider.of<TaskData>(context, listen: false).updateTask(
                    Provider.of<TaskData>(context, listen: false).allTasks[i]);
                // setState(() {
                //   widget.tasks[i].toggleDone();
                // });
              },
            );
          },
          itemCount: Provider.of<TaskData>(context).taskCount,
        );
      },
    );
  }
}

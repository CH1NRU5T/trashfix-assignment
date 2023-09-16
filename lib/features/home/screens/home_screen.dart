import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashfix_assignment/constants/constants.dart';
import 'package:trashfix_assignment/constants/extensions.dart';
import 'package:trashfix_assignment/features/task/screens/add_task_screen.dart';
import 'package:trashfix_assignment/models/task_model.dart';
import 'package:trashfix_assignment/providers/task_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';

  completeTaskAndCongratulate(
      TaskProvider value, int index, BuildContext context) {
    TaskModel task = value.markTaskComplete(index);
    Duration diff = task.completedAt!.difference(task.createdAt);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: const Text('Congratulations!'),
          content: Text(
              'You have successfully completed the task \'${task.title}\'\n\n'
              'It took you ${diff.inDays} days, ${diff.inHours} hours, ${diff.inMinutes} minutes, ${diff.inSeconds} seconds to complete this task.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddTaskScreen.routeName);
        },
      ),
      appBar: AppBar(
        title: const Text('Choose a Task'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, value, child) {
          return value.tasks.isEmpty
              ? Center(
                  child: Text(placeholder.getRandomElement()),
                )
              : Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        itemCount: value.tasks.length,
                        itemBuilder: (context, index) {
                          // Swipe to end the task and congratulate the user
                          return Dismissible(
                            key: Key(
                              value.tasks[index].createdAt.toIso8601String(),
                            ),
                            onDismissed: (direction) {
                              completeTaskAndCongratulate(
                                  value, index, context);
                            },
                            child: ListTile(
                              title: Text(value.tasks[index].title),
                              subtitle: Text(value.tasks[index].description),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashfix_assignment/constants/custom_textformfield.dart';
import 'package:trashfix_assignment/constants/extensions.dart';
import 'package:trashfix_assignment/models/task_model.dart';
import 'package:trashfix_assignment/providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  static const String routeName = '/add_task_screen';
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<TaskProvider>().addTask(
                      TaskModel(
                          title: _titleController.text,
                          createdAt: DateTime.now(),
                          description: _descriptionController.text,
                          isCompleted: false),
                    );
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(children: [
            CustomTextFormField(
              controller: _titleController,
              hintText: 'Title',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            10.height,
            CustomTextFormField(
              controller: _descriptionController,
              hintText: 'Description',
            )
          ]),
        ),
      ),
    );
  }
}

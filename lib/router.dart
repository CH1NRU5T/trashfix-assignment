import 'package:flutter/material.dart';
import 'package:trashfix_assignment/features/home/screens/home_screen.dart';
import 'package:trashfix_assignment/features/task/screens/add_task_screen.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case AddTaskScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AddTaskScreen());
    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}

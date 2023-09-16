import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashfix_assignment/features/home/screens/home_screen.dart';
import 'package:trashfix_assignment/providers/task_provider.dart';
import 'package:trashfix_assignment/router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TaskProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      onGenerateRoute: (RouteSettings settings) => generateRoute(settings),
    );
  }
}

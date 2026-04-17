import 'package:flutter/material.dart';

import 'core/di/injection_container.dart';
import 'features/task/presentation/pages/task_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies(); // Setup semua dependency
  runApp(const DevTaskApp());
}

class DevTaskApp extends StatelessWidget {
  const DevTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevTask',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const TaskListPage(),
    );
  }
}

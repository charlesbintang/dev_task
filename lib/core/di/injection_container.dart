import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/task/data/datasources/task_local_data_source.dart';
import '../../features/task/data/models/task_model.dart';
import '../../features/task/data/repositories/task_repository_impl.dart';
import '../../features/task/domain/repositories/task_repository.dart';
import '../../features/task/domain/usecases/add_task.dart';
import '../../features/task/domain/usecases/delete_task.dart';
import '../../features/task/domain/usecases/get_tasks.dart';
import '../../features/task/domain/usecases/update_task.dart';
import '../../features/task/presentation/bloc/task_bloc.dart';
import '../constants/app_constants.dart';

final sl = GetIt.instance; // sl = service locator

Future<void> initDependencies() async {
  // ─── Hive ───────────────────────────────────────────────
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter()); // Generated oleh build_runner
  final taskBox = await Hive.openBox<TaskModel>(AppConstants.TASK_BOX_NAME);

  // ─── Data Sources ────────────────────────────────────────
  sl.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(taskBox: taskBox),
  );

  // ─── Repositories ────────────────────────────────────────
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(localDataSource: sl()),
  );

  // ─── Use Cases ───────────────────────────────────────────
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => AddTask(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));

  // ─── BLoC ────────────────────────────────────────────────
  // BLoC didaftarkan sebagai Factory (bukan Singleton)
  // karena setiap halaman butuh instance baru
  sl.registerFactory(
    () => TaskBloc(
      getTasks: sl(),
      addTask: sl(),
      updateTask: sl(),
      deleteTask: sl(),
    ),
  );
}

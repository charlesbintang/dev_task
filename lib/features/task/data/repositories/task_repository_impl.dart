import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_data_source.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addTask(TaskEntity task) async {
    final model = TaskModel.fromEntity(task);
    await localDataSource.addTask(model);
  }

  @override
  Future<void> deleteTask(String id) async {
    await localDataSource.deleteTask(id);
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final models = await localDataSource.getTasks();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final model = TaskModel.fromEntity(task);
    await localDataSource.updateTask(model);
  }
}

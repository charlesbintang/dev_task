import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<void> addTask(TaskEntity task);
  Future<void> deleteTask(String id);
  Future<List<TaskEntity>> getTasks();
  Future<void> updateTask(TaskEntity task);
}

import '../../../../core/usecases/usecase.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

class AddTask implements UseCase<void, TaskEntity> {
  final TaskRepository repository;

  AddTask(this.repository);

  @override
  Future<void> call(TaskEntity task) {
    return repository.addTask(task);
  }
}

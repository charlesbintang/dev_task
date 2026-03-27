import '../../../../core/usecases/usecase.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

class GetTasks implements UseCase<List<TaskEntity>, NoParams> {
  final TaskRepository repository;

  GetTasks(this.repository);

  @override
  Future<List<TaskEntity>> call(NoParams params) {
    return repository.getTasks();
  }
}

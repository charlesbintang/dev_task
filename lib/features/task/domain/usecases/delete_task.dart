import '../../../../core/usecases/usecase.dart';
import '../repositories/task_repository.dart';

class DeleteTask implements UseCase<void, String> {
  final TaskRepository repository;

  DeleteTask(this.repository);

  @override
  Future<void> call(String id) {
    return repository.deleteTask(id);
  }
}

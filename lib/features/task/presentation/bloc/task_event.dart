import 'package:equatable/equatable.dart';

import '../../domain/entities/task_entity.dart';

class AddTaskEvent extends TaskEvent {
  final String title;
  final String? description;

  const AddTaskEvent({required this.title, this.description});

  @override
  List<Object?> get props => [title, description];
}

class DeleteTaskEvent extends TaskEvent {
  final String taskId;

  const DeleteTaskEvent(this.taskId);

  @override
  List<Object?> get props => [taskId];
}

class LoadTasksEvent extends TaskEvent {}

// Semua event yang bisa terjadi di fitur task
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class ToggleTaskCompletionEvent extends TaskEvent {
  final TaskEntity task;

  const ToggleTaskCompletionEvent(this.task);

  @override
  List<Object?> get props => [task];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskEntity task;

  const UpdateTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}

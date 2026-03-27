import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime createdAt;

  const TaskEntity({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, description, isCompleted, createdAt];

  TaskEntity copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

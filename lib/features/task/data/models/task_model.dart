import 'package:hive/hive.dart';

import '../../domain/entities/task_entity.dart';

part 'task_model.g.dart'; // File ini di-generate oleh build_runner

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    required this.createdAt,
  });

  // Konversi dari Entity ke Model (untuk disimpan)
  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
    );
  }

  // Konversi dari Model ke Entity (untuk dikirim ke presentation layer)
  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      createdAt: createdAt,
    );
  }
}

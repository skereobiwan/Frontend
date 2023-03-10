import 'package:skere_app/data/entities/task_entity.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/model/task.dart';
import 'package:dartz/dartz.dart';

abstract class TaskDataSource {
  Future<List<TaskEntity>> find({
    Customer customer,
    Priority priority,
    String subject,
    Status status,
    DateTime dueDate,
  });
  Future<TaskEntity> findOne(String id);
  Future<Unit> create(TaskEntity task);
  Future<Unit> delete(String id);
  Future<Unit> update(
    String id, {
    Customer? customer,
    Priority? priority,
    String? subject,
    Status? status,
    DateTime? dueDate,
  });
}

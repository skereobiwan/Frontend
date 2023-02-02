import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/model/task.dart';

import "package:dartz/dartz.dart";

abstract class TaskRepository {
  Future<Either<Failure, List<CRMTask>>> getAllTasks();
  Future<Either<Failure, Unit>> createTask(CRMTask data);
  Future<Either<Failure, Unit>> deleteTask(String id);
  Future<Either<Failure, Unit>> updateTask(
    String id, {
    Customer? customer,
    Priority? priority,
    String? subject,
    Status? status,
    DateTime? dueDate,
  });
}

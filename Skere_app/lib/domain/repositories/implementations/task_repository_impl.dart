import 'package:skere_app/data/data_sources/interfaces/task_datasource.dart';
import 'package:skere_app/data/entities/task_entity.dart';
import 'package:skere_app/domain/model/task.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/repositories/interfaces/task_repository.dart';
import 'package:dartz/dartz.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskDataSource taskDataSource;
  TaskRepositoryImpl(this.taskDataSource);

  @override
  Future<Either<Failure, Unit>> createTask(CRMTask task) async {
    try {
      final result = await taskDataSource.create(TaskEntity(
        id: task.id,
        customer: task.customer,
        subject: task.subject,
        dueDate: task.dueDate,
      ));
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(String id) async {
    try {
      final result = await taskDataSource.delete(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CRMTask>>> getAllTasks() async {
    try {
      final result = await taskDataSource.find();
      return Right(result
          .map((e) => CRMTask(
                id: e.id,
                subject: e.subject,
                customer: e.customer,
                dueDate: e.dueDate,
                priority: e.priority,
              ))
          .toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTask(
    String id, {
    Customer? customer,
    Priority? priority,
    String? subject,
    Status? status,
    DateTime? dueDate,
  }) async {
    try {
      final result = await taskDataSource.update(
        id,
        customer: customer,
        priority: priority,
        subject: subject,
        status: status,
        dueDate: dueDate,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

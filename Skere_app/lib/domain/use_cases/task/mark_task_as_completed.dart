import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/task.dart';
import 'package:skere_app/domain/repositories/interfaces/task_repository.dart';
import 'package:dartz/dartz.dart';

abstract class MarkTaskAsComplete {
  Future<Either<Failure, Unit>> execute(String id);
}

class MarkTaskAsCompleteImpl implements MarkTaskAsComplete {
  TaskRepository taskRepository;
  MarkTaskAsCompleteImpl(this.taskRepository);

  @override
  Future<Either<Failure, Unit>> execute(String id) async {
    final result = await taskRepository.updateTask(id, status: Status.completed);
    return result;
  }
}

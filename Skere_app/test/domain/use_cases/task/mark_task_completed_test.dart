import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/task.dart';
import 'package:skere_app/domain/repositories/interfaces/task_repository.dart';
import 'package:skere_app/domain/use_cases/task/mark_task_as_completed.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late TaskRepository mockTaskRepository;
  late MarkTaskAsComplete usecase;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = MarkTaskAsCompleteImpl(mockTaskRepository);
  });

  test("should call the updateTask with status completed", () async {
    //arrange
    const id = "1001";
    Either<Failure, Unit> repoResponse = const Right(unit);
    when(() => mockTaskRepository.updateTask(id, status: Status.completed))
        .thenAnswer((realInvocation) async => repoResponse);

    //act
    final result = await usecase.execute(id);

    //assert
    expect(result, equals(repoResponse));
    verify(() => mockTaskRepository.updateTask(id, status: Status.completed));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}

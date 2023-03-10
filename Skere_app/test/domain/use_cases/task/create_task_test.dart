import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/model/task.dart';
import 'package:skere_app/domain/repositories/interfaces/task_repository.dart';
import 'package:skere_app/domain/use_cases/task/create_task.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late TaskRepository mockTaskRepository;
  late CreateTask usecase;
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = CreateTaskImpl(mockTaskRepository);
  });

  test("should call createTask of task repo", () async {
    //arrange
    var customer = const Customer(id: "123", name: "Person", email: "person@email.com");
    var task = CRMTask(
      id: "1",
      customer: customer,
      subject: "Introduction meeting with customer",
      dueDate: DateTime.now(),
    );
    Either<Failure, Unit> repoResponse = const Right(unit);
    when(() => mockTaskRepository.createTask(task)).thenAnswer((realInvocation) async => repoResponse);

    //act
    final result = await usecase.execute(task);

    //assert
    expect(result, equals(repoResponse));
    verify(() => mockTaskRepository.createTask(task));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}

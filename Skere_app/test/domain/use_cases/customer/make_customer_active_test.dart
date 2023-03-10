import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:skere_app/domain/use_cases/customer/make_customer_active.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomerRepository extends Mock implements CustomerRepository {}

void main() {
  late CustomerRepository mockCustomerRepository;
  late MakeCustomerActive usecase;

  setUp(() {
    mockCustomerRepository = MockCustomerRepository();
    usecase = MakeCustomerActiveImpl(mockCustomerRepository);
  });

  test("should call the updateCustomer repo method with customerId and isActive: true successfully", () async {
    //arrange
    const customerId = "1234";
    const data = {"isActive": true};
    Either<Failure, Unit> repoResponse = const Right(unit);
    when(() => mockCustomerRepository.updateCustomer(customerId, isActive: true)).thenAnswer((_) async => repoResponse);

    //act
    final result = await usecase.execute(customerId);

    //assert
    expect(result, equals(repoResponse));
    verify(() => mockCustomerRepository.updateCustomer(customerId, isActive: true));
    verifyNoMoreInteractions(mockCustomerRepository);
  });
}

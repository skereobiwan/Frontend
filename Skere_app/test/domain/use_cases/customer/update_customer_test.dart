import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:skere_app/domain/use_cases/customer/update_customer_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomerRepository extends Mock implements CustomerRepository {}

void main() {
  late CustomerRepository mockCustomerRepository;
  late UpdateCustomer usecase;
  setUp(() {
    mockCustomerRepository = MockCustomerRepository();
    usecase = UpdateCustomerImpl(mockCustomerRepository);
  });

  test("should call updateCustomer method of customer repo with id and customer data", () async {
    //arrange
    const customerId = "123";
    Either<Failure, Unit> repoResponse =const Right(unit);
    when(() => mockCustomerRepository.updateCustomer(customerId, name: "Jim"))
        .thenAnswer((realInvocation) async => repoResponse);

    //act
    final result = await usecase.execute(customerId, name: "Jim");

    //assert
    expect(result, equals(repoResponse));
    verify(() => mockCustomerRepository.updateCustomer(customerId, name: "Jim"));
    verifyNoMoreInteractions(mockCustomerRepository);
  });
}

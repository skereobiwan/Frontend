import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:skere_app/domain/use_cases/lead/get_lead.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomerRepository extends Mock implements CustomerRepository {}

void main() {
  late CustomerRepository mockCustomerRepository;
  late GetLead usecase;
  setUp(() {
    mockCustomerRepository = MockCustomerRepository();
    usecase = GetLeadImpl(mockCustomerRepository);
  });

  test("should call getCustomer repo method with id", () async {
    //arrange
    const id = "123";

    Either<Failure, Customer> repoResponse = const Right(Customer(id: "123", name: "Jim", email: "person@email.com"));
    when(() => mockCustomerRepository.getCustomer(id)).thenAnswer((realInvocation) async => repoResponse);

    //act
    final result = await usecase.execute(id);

    //assert
    expect(result, equals(repoResponse));
    verify(() => mockCustomerRepository.getCustomer(id));
    verifyNoMoreInteractions(mockCustomerRepository);
  });
}

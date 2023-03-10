import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:skere_app/domain/use_cases/lead/convert_lead_to_customer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomerRepository extends Mock implements CustomerRepository {}

void main() {
  late CustomerRepository mockCustomerRepository;
  late ConvertLeadToCustomer usecase;
  setUp(() {
    mockCustomerRepository = MockCustomerRepository();
    usecase = ConvertLeadToCustomerImpl(mockCustomerRepository);
  });

  test("should call update customer method to update the type", () async {
    //arrange
    const id = "123";
    Either<Failure, Unit> repoResponse = const Right(unit);
    when(() => mockCustomerRepository.updateCustomer(id, customerType: CustomerType.lead))
        .thenAnswer((realInvocation) async => repoResponse);

    //act
    final result = await usecase.execute(id);

    //assert
    expect(result, equals(repoResponse));
    verify(() => mockCustomerRepository.updateCustomer(id, customerType: CustomerType.lead));
    verifyNoMoreInteractions(mockCustomerRepository);
  });
}

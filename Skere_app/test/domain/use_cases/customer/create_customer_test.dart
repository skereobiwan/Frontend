import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:skere_app/domain/use_cases/customer/create_customer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

class MockCustomerRepository extends Mock implements CustomerRepository {}

void main() {
  late CustomerRepository mockCustomerRepository;
  late CreateCustomer usecase;

  setUp(() {
    mockCustomerRepository = MockCustomerRepository();
    usecase = CreateCustomerImpl(mockCustomerRepository);
  });

  test("should call the createCustmer customer repo method", () async {
    //arrange
    var repoResult = const Right<Failure, Unit>(unit);
    var data = Customer(id: const Uuid().v4(), email: "john@gmail.com", name: 'John');
    when(() => mockCustomerRepository.createCustomer(data)).thenAnswer((_) async => repoResult);

    //act
    final result = await usecase.execute(data);

    //assert
    expect(result, equals(repoResult));
    verify(() => mockCustomerRepository.createCustomer(data));
    verifyNoMoreInteractions(mockCustomerRepository);
  });
}

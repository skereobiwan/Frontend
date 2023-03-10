import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:dartz/dartz.dart';

abstract class CreateCustomer {
  Future<Either<Failure, Unit>> execute(Customer customer);
}

class CreateCustomerImpl implements CreateCustomer {
  final CustomerRepository customerRepository;
  CreateCustomerImpl(this.customerRepository);

  @override
  Future<Either<Failure, Unit>> execute(Customer customer) async {
    return await customerRepository.createCustomer(customer);
  }
}

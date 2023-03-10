import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteCustomer {
  Future<Either<Failure, Unit>> execute(String customerId);
}

class DeleteCustomerImpl implements DeleteCustomer {
  CustomerRepository customerRepository;
  DeleteCustomerImpl(this.customerRepository);

  @override
  Future<Either<Failure, Unit>> execute(String customerId) async {
    return await customerRepository.deleteCustomer(customerId);
  }
}

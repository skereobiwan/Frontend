import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateCustomer {
  Future<Either<Failure, Unit>> execute(String customerId, {String? name, String? email, bool? isActive});
}

class UpdateCustomerImpl implements UpdateCustomer {
  CustomerRepository customerRepository;
  UpdateCustomerImpl(this.customerRepository);

  @override
  Future<Either<Failure, Unit>> execute(String customerId, {String? name, String? email, bool? isActive}) async {
    final result = await customerRepository.updateCustomer(customerId, name: name, email: email, isActive: isActive);
    return result;
  }
}

import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:dartz/dartz.dart';

abstract class MakeCustomerInActive {
  Future<Either<Failure, Unit>> execute(String customerId);
}

class MakeCustomerInActiveImpl implements MakeCustomerInActive {
  CustomerRepository customerRepository;
  MakeCustomerInActiveImpl(this.customerRepository);

  @override
  Future<Either<Failure, Unit>> execute(String customerId) async {
    final result = await customerRepository.updateCustomer(customerId, isActive: false);
    return result;
  }
}

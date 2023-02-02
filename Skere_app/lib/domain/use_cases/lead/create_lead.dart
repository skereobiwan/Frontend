import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:dartz/dartz.dart';

abstract class CreateLead {
  Future<Either<Failure, Unit>> execute(Customer customer);
}

class CreateLeadImpl implements CreateLead {
  CustomerRepository customerRepository;
  CreateLeadImpl(this.customerRepository);

  @override
  Future<Either<Failure, Unit>> execute(Customer customer) async {
    final result = await customerRepository.createCustomer(customer);
    return result;
  }
}

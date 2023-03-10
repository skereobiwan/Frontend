import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteLead {
  Future<Either<Failure, Unit>> execute(String leadId);
}

class DeleteLeadImpl implements DeleteLead {
  CustomerRepository customerRepository;
  DeleteLeadImpl(this.customerRepository);

  @override
  Future<Either<Failure, Unit>> execute(String leadId) async {
    final result = await customerRepository.deleteCustomer(leadId);
    return result;
  }
}

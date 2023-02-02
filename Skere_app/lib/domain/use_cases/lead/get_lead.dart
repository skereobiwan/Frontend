import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetLead {
  Future<Either<Failure, Customer>> execute(String leadId);
}

class GetLeadImpl implements GetLead {
  CustomerRepository customerRepository;
  GetLeadImpl(this.customerRepository);

  @override
  Future<Either<Failure, Customer>> execute(String leadId) async {
    final result = await customerRepository.getCustomer(leadId);
    return result;
  }
}

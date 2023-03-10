import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ConvertLeadToCustomer {
  Future<Either<Failure, Unit>> execute(String leadId);
}

class ConvertLeadToCustomerImpl implements ConvertLeadToCustomer {
  CustomerRepository customerRepository;
  ConvertLeadToCustomerImpl(this.customerRepository);

  @override
  Future<Either<Failure, Unit>> execute(String leadId) async {
    final result = await customerRepository.updateCustomer(leadId, customerType: CustomerType.lead);
    return result;
  }
}

import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/repositories/interfaces/customer_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateLead {
  Future<Either<Failure, Unit>> execute(
    String leadId, {
    String? name,
    String? email,
    CustomerType? customerType,
    bool? isActive,
  });
}

class UpdateLeadImpl implements UpdateLead {
  CustomerRepository customerRepository;
  UpdateLeadImpl(this.customerRepository);

  @override
  Future<Either<Failure, Unit>> execute(
    String leadId, {
    String? name,
    String? email,
    CustomerType? customerType,
    bool? isActive,
  }) async {
    final result = await customerRepository.updateCustomer(
      leadId,
      name: name,
      email: email,
      customerType: customerType,
      isActive: isActive,
    );
    return result;
  }
}

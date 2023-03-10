import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';

import "package:dartz/dartz.dart";

abstract class CustomerRepository {
  Future<Either<Failure, List<Customer>>> getAllCustomers(CustomerType customerType);
  Future<Either<Failure, Customer>> getCustomer(String id);
  Future<Either<Failure, Unit>> createCustomer(Customer data);
  Future<Either<Failure, Unit>> deleteCustomer(String id);
  Future<Either<Failure, Unit>> updateCustomer(
    String id, {
    String? name,
    String? email,
    CustomerType? customerType,
    bool? isActive,
  });
}

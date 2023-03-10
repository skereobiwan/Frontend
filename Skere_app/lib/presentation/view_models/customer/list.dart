import 'package:skere_app/core/error/failures.dart';
import 'package:skere_app/domain/model/customer.dart';
import 'package:skere_app/domain/use_cases/customer/get_all_customers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomerListViewModel {
  List<Customer> data;
  String error;
  Function fetchData;
  CustomerListViewModel({required this.data, required this.fetchData, required this.error});
}

CustomerListViewModel useCustomerListViewModel({required GetAllCustomers getAllCustomers}) {
  final customers = useState<List<Customer>>([]);
  final error = useState<String>("");

  void fetchData() async {
    error.value = "";
    var result = await getAllCustomers.execute();
    result.fold((failure) {
      if (failure == ServerFailure()) {
        error.value = "Error Fetching Customers!";
      }
    }, (data) {
      customers.value = data;
    });
  }

  return CustomerListViewModel(fetchData: fetchData, data: customers.value, error: error.value);
}

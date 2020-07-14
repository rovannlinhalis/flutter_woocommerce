import 'package:r_flutter_woocommerce/models/customers/customer.dart';
import 'package:r_flutter_woocommerce/models/generic/batch.dart';

class BatchCustomer extends BatchGeneric<Customer> {
  BatchCustomer() : super(creator: () => new Customer());
}

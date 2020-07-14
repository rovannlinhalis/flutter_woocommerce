import 'package:r_flutter_woocommerce/models/generic/batch.dart';
import 'package:r_flutter_woocommerce/models/orders/order.dart';

class BatchOrder extends BatchGeneric<Order> {
  BatchOrder() : super(creator: () => new Order());
}

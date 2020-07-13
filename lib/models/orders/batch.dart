import 'package:flutter_woocommerce/models/generic/batch.dart';
import 'package:flutter_woocommerce/models/orders/order.dart';

class BatchOrder extends BatchGeneric<Order> {
    BatchOrder() : super(creator: ()=> new Order());
}
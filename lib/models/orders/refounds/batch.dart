import 'package:flutter_woocommerce/models/generic/batch.dart';
import 'package:flutter_woocommerce/models/orders/refounds/refound.dart';

class BatchRefound extends BatchGeneric<Refound> {
    BatchRefound() : super(creator: ()=> new Refound());
}
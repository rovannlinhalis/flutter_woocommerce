import 'package:r_flutter_woocommerce/models/generic/batch.dart';
import 'package:r_flutter_woocommerce/models/orders/refounds/refound.dart';

class BatchRefound extends BatchGeneric<Refound> {
  BatchRefound() : super(creator: () => new Refound());
}

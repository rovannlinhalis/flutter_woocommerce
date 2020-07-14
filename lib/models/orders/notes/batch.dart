import 'package:r_flutter_woocommerce/models/generic/batch.dart';
import 'package:r_flutter_woocommerce/models/orders/notes/orderNote.dart';

class BatchOrderNotes extends BatchGeneric<OrderNote> {
  BatchOrderNotes() : super(creator: () => new OrderNote());
}

import 'package:r_flutter_woocommerce/models/generic/batch.dart';
import 'package:r_flutter_woocommerce/models/products/variation/variation.dart';


class BatchVariation extends BatchGeneric<Variation> {
    BatchVariation() : super(creator: ()=> new Variation());
}
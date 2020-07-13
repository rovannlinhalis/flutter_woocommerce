import 'package:flutter_woocommerce/models/generic/batch.dart';
import 'package:flutter_woocommerce/models/products/variation/variation.dart';


class BatchVariation extends BatchGeneric<Variation> {
    BatchVariation() : super(creator: ()=> new Variation());
}
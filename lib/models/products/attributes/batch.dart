import 'package:flutter_woocommerce/models/generic/batch.dart';
import 'package:flutter_woocommerce/models/products/attributes/attributes.dart';


class BatchAttribute extends BatchGeneric<ProductAttribute> {
    BatchAttribute() : super(creator: ()=> new ProductAttribute());
}

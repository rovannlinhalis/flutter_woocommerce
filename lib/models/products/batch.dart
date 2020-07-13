import 'package:flutter_woocommerce/models/generic/batch.dart';
import 'package:flutter_woocommerce/models/products/product.dart';


class BatchProduct extends BatchGeneric<Product> {
    BatchProduct() : super(creator: ()=> new Product());
}
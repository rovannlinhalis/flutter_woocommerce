import 'package:r_flutter_woocommerce/models/generic/batch.dart';
import 'package:r_flutter_woocommerce/models/products/product.dart';


class BatchProduct extends BatchGeneric<Product> {
    BatchProduct() : super(creator: ()=> new Product());
}
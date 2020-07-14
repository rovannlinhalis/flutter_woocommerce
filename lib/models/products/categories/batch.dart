import 'package:r_flutter_woocommerce/models/generic/batch.dart';
import 'package:r_flutter_woocommerce/models/products/categories/productCategory.dart';

class BatchCategory extends BatchGeneric<ProductCategory> {
  BatchCategory() : super(creator: () => new ProductCategory());
}

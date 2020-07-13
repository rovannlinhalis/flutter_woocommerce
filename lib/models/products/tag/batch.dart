import 'package:flutter_woocommerce/models/generic/batch.dart';
import 'package:flutter_woocommerce/models/products/tag/productTag.dart';

class BatchTag extends BatchGeneric<Tag> {
    BatchTag() : super(creator: ()=> new Tag());
}
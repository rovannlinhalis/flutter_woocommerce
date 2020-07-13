import 'package:flutter_woocommerce/models/generic/batch.dart';
import 'package:flutter_woocommerce/models/products/attribute_terms/attributeTerm.dart';


class BatchAttributeTerms extends BatchGeneric<AttributeTerms> {
    BatchAttributeTerms() : super(creator: ()=> new AttributeTerms());
}
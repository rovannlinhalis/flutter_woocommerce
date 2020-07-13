import 'package:r_flutter_woocommerce/models/generic/batch.dart';
import 'package:r_flutter_woocommerce/models/products/attribute_terms/attributeTerm.dart';


class BatchAttributeTerms extends BatchGeneric<AttributeTerms> {
    BatchAttributeTerms() : super(creator: ()=> new AttributeTerms());
}
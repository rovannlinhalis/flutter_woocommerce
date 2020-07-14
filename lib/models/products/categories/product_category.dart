import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:r_flutter_woocommerce/models/generic/batch.dart';

class ProductCategory extends BaseModel {
  int id;
  String name;
  String slug;

  ProductCategory({this.id, this.name, this.slug});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class BatchCategory extends BatchGeneric<ProductCategory> {
  BatchCategory() : super(creator: () => new ProductCategory());
}

import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:r_flutter_woocommerce/models/generic/batch.dart';

class ProductAttribute extends BaseModel {
  int id;
  String name;
  int position;
  bool visible;
  bool variation;
  List<String> options;

  ProductAttribute(
      {this.id,
      this.name,
      this.position,
      this.visible,
      this.variation,
      this.options});

  ProductAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    visible = json['visible'];
    variation = json['variation'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    data['visible'] = this.visible;
    data['variation'] = this.variation;
    data['options'] = this.options;
    return data;
  }
}

class BatchAttribute extends BatchGeneric<ProductAttribute> {
  BatchAttribute() : super(creator: () => new ProductAttribute());
}

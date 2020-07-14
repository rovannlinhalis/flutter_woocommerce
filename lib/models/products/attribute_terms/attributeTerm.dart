import 'package:r_flutter_woocommerce/models/generic/link.dart';
import 'package:r_flutter_woocommerce/models/base/baseModel.dart';

class AttributeTerms extends BaseModel {
  int id;
  String name;
  String slug;
  String description;
  int menuOrder;
  int count;
  Links lLinks;

  AttributeTerms(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.menuOrder,
      this.count,
      this.lLinks});

  AttributeTerms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    menuOrder = json['menu_order'];
    count = json['count'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['menu_order'] = this.menuOrder;
    data['count'] = this.count;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

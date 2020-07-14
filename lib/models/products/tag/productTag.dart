import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:r_flutter_woocommerce/models/generic/link.dart';

class Tag extends BaseModel {
  int id;
  String name;
  String slug;
  String description;
  int count;
  Links lLinks;

  Tag(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.count,
      this.lLinks});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    count = json['count'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['count'] = this.count;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

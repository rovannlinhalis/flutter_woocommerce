import 'package:r_flutter_woocommerce/models/generic/meta.dart';

class CouponLine {
  int id;
  String code;
  String discount;
  String discountTax;
  List<Meta> metaData;

  CouponLine(
      {this.id, this.code, this.discount, this.discountTax, this.metaData});

  CouponLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    discount = json['discount'];
    discountTax = json['discount_tax'];
    if (json['meta_data'] != null) {
      metaData = new List<Meta>();
      json['meta_data'].forEach((v) {
        metaData.add(new Meta.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['discount'] = this.discount;
    data['discount_tax'] = this.discountTax;

    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

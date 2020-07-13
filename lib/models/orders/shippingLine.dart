
import 'package:flutter_woocommerce/models/generic/meta.dart';
import 'package:flutter_woocommerce/models/orders/orderTaxes.dart';

class ShippingLines {
  int id;
  String methodTitle;
  String methodId;
  String total;
  String totalTax;
  List<OrderTaxes> taxes;
  List<Meta> metaData;

  ShippingLines(
      {this.id,
      this.methodTitle,
      this.methodId,
      this.total,
      this.totalTax,
      this.taxes,
      this.metaData});

  ShippingLines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    methodTitle = json['method_title'];
    methodId = json['method_id'];
    total = json['total'];
    totalTax = json['total_tax'];
    if (json['taxes'] != null) {
      taxes = new List<OrderTaxes>();
      json['taxes'].forEach((v) {
        taxes.add(new OrderTaxes.fromJson(v));
      });
    }
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
    data['method_title'] = this.methodTitle;
    data['method_id'] = this.methodId;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    if (this.taxes != null) {
      data['taxes'] = this.taxes.map((v) => v.toJson()).toList();
    }
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

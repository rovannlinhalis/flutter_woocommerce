import 'package:r_flutter_woocommerce/models/generic/meta.dart';
import 'package:r_flutter_woocommerce/models/orders/taxe.dart';

class FeeLine {
  int id;
  String name;
  String taxClass;
  String taxStatus;
  String total;
  String totalTax;
  List<Taxes> taxes;
  List<Meta> metaData;

  FeeLine(
      {this.id, this.name, this.taxClass, this.taxStatus, this.total, this.totalTax, this.taxes, this.metaData});

  FeeLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    taxClass = json['tax_class'];
    taxStatus = json['tax_status'];
    total = json['total'];
    totalTax = json['total_tax'];


    if (json['taxes'] != null) {
      taxes = new List<Taxes>();
      json['taxes'].forEach((v) {
        taxes.add(new Taxes.fromJson(v));
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

    data['name'] = this.name;
    data['tax_class'] = this.taxClass;
    data['tax_status'] = this.taxStatus;
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

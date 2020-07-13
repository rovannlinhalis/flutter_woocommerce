
import 'package:r_flutter_woocommerce/models/generic/meta.dart';

class TaxLines {
  int id;
  String rateCode;
  int rateId;
  String label;
  bool compound;
  String taxTotal;
  String shippingTaxTotal;
  List<Meta> metaData;

  TaxLines(
      {this.id,
      this.rateCode,
      this.rateId,
      this.label,
      this.compound,
      this.taxTotal,
      this.shippingTaxTotal,
      this.metaData});

  TaxLines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rateCode = json['rate_code'];
    rateId = json['rate_id'];
    label = json['label'];
    compound = json['compound'];
    taxTotal = json['tax_total'];
    shippingTaxTotal = json['shipping_tax_total'];
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
    data['rate_code'] = this.rateCode;
    data['rate_id'] = this.rateId;
    data['label'] = this.label;
    data['compound'] = this.compound;
    data['tax_total'] = this.taxTotal;
    data['shipping_tax_total'] = this.shippingTaxTotal;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
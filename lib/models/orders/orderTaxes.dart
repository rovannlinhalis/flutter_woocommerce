import 'package:r_flutter_woocommerce/models/generic/meta.dart';

class OrderTaxes {
  int id;
  String rateCode;
  String rateId;
  String label;
  String reason;
  bool compound;
  String taxTotal;
  String shippingTaxTotal;
  List<Meta> metaData;

  OrderTaxes(
      {this.id,
      this.rateCode,
      this.rateId,
      this.label,
      this.reason,
      this.compound,
      this.taxTotal,
      this.shippingTaxTotal,
      this.metaData});

  OrderTaxes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rateCode = json['rate_code'];
    rateId = json['rate_id'];
    label = json['label'];
    reason = json['reason'];
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

    data['rate_code'] = rateCode;
    data['rate_id'] = rateId;
    data['label'] = label;
    data['reason'] = reason;
    data['compound'] = compound;
    data['tax_total'] = taxTotal;
    data['shipping_tax_total'] = shippingTaxTotal;

    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

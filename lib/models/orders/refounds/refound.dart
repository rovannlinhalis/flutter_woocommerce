import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:r_flutter_woocommerce/models/generic/link.dart';
import 'package:r_flutter_woocommerce/models/generic/meta.dart';
import 'package:r_flutter_woocommerce/models/orders/lineItem.dart';

class Refound extends BaseModel {
  int id;
  String dateCreated;
  String dateCreatedGmt;
  String amount;
  String reason;
  int refundedBy;
  bool refundedPayment;
  List<Meta> metaData;
  List<LineItems> lineItems;
  Links lLinks;

  Refound(
      {this.id,
      this.dateCreated,
      this.dateCreatedGmt,
      this.amount,
      this.reason,
      this.refundedBy,
      this.refundedPayment,
      this.metaData,
      this.lineItems,
      this.lLinks});

  Refound.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    amount = json['amount'];
    reason = json['reason'];
    refundedBy = json['refunded_by'];
    refundedPayment = json['refunded_payment'];
    if (json['meta_data'] != null) {
      metaData = new List<Meta>();
      json['meta_data'].forEach((v) {
        metaData.add(new Meta.fromJson(v));
      });
    }
    if (json['line_items'] != null) {
      lineItems = new List<LineItems>();
      json['line_items'].forEach((v) {
        lineItems.add(new LineItems.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['amount'] = this.amount;
    data['reason'] = this.reason;
    data['refunded_by'] = this.refundedBy;
    data['refunded_payment'] = this.refundedPayment;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

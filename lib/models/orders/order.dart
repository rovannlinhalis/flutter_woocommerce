import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:r_flutter_woocommerce/models/customers/billing.dart';
import 'package:r_flutter_woocommerce/models/customers/shipping.dart';
import 'package:r_flutter_woocommerce/models/generic/link.dart';
import 'package:r_flutter_woocommerce/models/generic/meta.dart';
import 'package:r_flutter_woocommerce/models/orders/couponLines.dart';
import 'package:r_flutter_woocommerce/models/orders/feeLines.dart';
import 'package:r_flutter_woocommerce/models/orders/lineItem.dart';
import 'package:r_flutter_woocommerce/models/orders/shippingLine.dart';
import 'package:r_flutter_woocommerce/models/orders/taxLine.dart';

import 'orderRefound.dart';

class Order extends BaseModel {
  int id;
  int parentId;
  String number;
  String orderKey;
  String createdVia;
  String version;
  String status;
  String currency;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  String discountTotal;
  String discountTax;
  String shippingTotal;
  String shippingTax;
  String cartTax;
  String total;
  String totalTax;
  bool pricesIncludeTax;
  int customerId;
  String customerIpAddress;
  String customerUserAgent;
  String customerNote;
  Billing billing;
  Shipping shipping;
  String paymentMethod;
  String paymentMethodTitle;
  String transactionId;
  String datePaid;
  String datePaidGmt;
  Null dateCompleted;
  Null dateCompletedGmt;
  String cartHash;
  List<Meta> metaData;
  List<LineItems> lineItems;
  List<TaxLines> taxLines;
  List<ShippingLines> shippingLines;
  List<FeeLine> feeLines;
  List<CouponLine> couponLines;
  List<OrderRefound> refunds;
  Links lLinks;

  Order(
      {this.id,
      this.parentId,
      this.number,
      this.orderKey,
      this.createdVia,
      this.version,
      this.status,
      this.currency,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.discountTotal,
      this.discountTax,
      this.shippingTotal,
      this.shippingTax,
      this.cartTax,
      this.total,
      this.totalTax,
      this.pricesIncludeTax,
      this.customerId,
      this.customerIpAddress,
      this.customerUserAgent,
      this.customerNote,
      this.billing,
      this.shipping,
      this.paymentMethod,
      this.paymentMethodTitle,
      this.transactionId,
      this.datePaid,
      this.datePaidGmt,
      this.dateCompleted,
      this.dateCompletedGmt,
      this.cartHash,
      this.metaData,
      this.lineItems,
      this.taxLines,
      this.shippingLines,
      this.feeLines,
      this.couponLines,
      this.refunds,
      this.lLinks});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    number = json['number'];
    orderKey = json['order_key'];
    createdVia = json['created_via'];
    version = json['version'];
    status = json['status'];
    currency = json['currency'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    discountTotal = json['discount_total'];
    discountTax = json['discount_tax'];
    shippingTotal = json['shipping_total'];
    shippingTax = json['shipping_tax'];
    cartTax = json['cart_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    pricesIncludeTax = json['prices_include_tax'];
    customerId = json['customer_id'];
    customerIpAddress = json['customer_ip_address'];
    customerUserAgent = json['customer_user_agent'];
    customerNote = json['customer_note'];
    billing =
        json['billing'] != null ? new Billing.fromJson(json['billing']) : null;
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    paymentMethod = json['payment_method'];
    paymentMethodTitle = json['payment_method_title'];
    transactionId = json['transaction_id'];
    datePaid = json['date_paid'];
    datePaidGmt = json['date_paid_gmt'];
    dateCompleted = json['date_completed'];
    dateCompletedGmt = json['date_completed_gmt'];
    cartHash = json['cart_hash'];
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
    if (json['tax_lines'] != null) {
      taxLines = new List<TaxLines>();
      json['tax_lines'].forEach((v) {
        taxLines.add(new TaxLines.fromJson(v));
      });
    }
    if (json['shipping_lines'] != null) {
      shippingLines = new List<ShippingLines>();
      json['shipping_lines'].forEach((v) {
        shippingLines.add(new ShippingLines.fromJson(v));
      });
    }
    if (json['fee_lines'] != null) {
      feeLines = new List<FeeLine>();
      json['fee_lines'].forEach((v) {
        feeLines.add(new FeeLine.fromJson(v));
      });
    }
    if (json['coupon_lines'] != null) {
      couponLines = new List<CouponLine>();
      json['coupon_lines'].forEach((v) {
        couponLines.add(new CouponLine.fromJson(v));
      });
    }
    if (json['refunds'] != null) {
      refunds = new List<OrderRefound>();
      json['refunds'].forEach((v) {
        refunds.add(new OrderRefound.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['number'] = this.number;
    data['order_key'] = this.orderKey;
    data['created_via'] = this.createdVia;
    data['version'] = this.version;
    data['status'] = this.status;
    data['currency'] = this.currency;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['discount_total'] = this.discountTotal;
    data['discount_tax'] = this.discountTax;
    data['shipping_total'] = this.shippingTotal;
    data['shipping_tax'] = this.shippingTax;
    data['cart_tax'] = this.cartTax;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    data['prices_include_tax'] = this.pricesIncludeTax;
    data['customer_id'] = this.customerId;
    data['customer_ip_address'] = this.customerIpAddress;
    data['customer_user_agent'] = this.customerUserAgent;
    data['customer_note'] = this.customerNote;
    if (this.billing != null) {
      data['billing'] = this.billing.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping.toJson();
    }
    data['payment_method'] = this.paymentMethod;
    data['payment_method_title'] = this.paymentMethodTitle;
    data['transaction_id'] = this.transactionId;
    data['date_paid'] = this.datePaid;
    data['date_paid_gmt'] = this.datePaidGmt;
    data['date_completed'] = this.dateCompleted;
    data['date_completed_gmt'] = this.dateCompletedGmt;
    data['cart_hash'] = this.cartHash;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems.map((v) => v.toJson()).toList();
    }
    if (this.taxLines != null) {
      data['tax_lines'] = this.taxLines.map((v) => v.toJson()).toList();
    }
    if (this.shippingLines != null) {
      data['shipping_lines'] =
          this.shippingLines.map((v) => v.toJson()).toList();
    }
    if (this.feeLines != null) {
      data['fee_lines'] = this.feeLines.map((v) => v.toJson()).toList();
    }
    if (this.couponLines != null) {
      data['coupon_lines'] = this.couponLines.map((v) => v.toJson()).toList();
    }
    if (this.refunds != null) {
      data['refunds'] = this.refunds.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

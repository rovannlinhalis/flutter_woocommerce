import 'dart:convert';

import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:r_flutter_woocommerce/models/generic/link.dart';
import 'package:r_flutter_woocommerce/models/generic/meta.dart';

class Coupon extends BaseModel {
  int id;
  String code;
  String amount;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  String discountType;
  String description;
  Null dateExpires;
  Null dateExpiresGmt;
  int usageCount;
  bool individualUse;
  List<int> productIds;
  List<int> excludedProductIds;
  Null usageLimit;
  Null usageLimitPerUser;
  Null limitUsageToXItems;
  bool freeShipping;
  List<int> productCategories;
  List<int> excludedProductCategories;
  bool excludeSaleItems;
  String minimumAmount;
  String maximumAmount;
  List<String> emailRestrictions;
  List<String> usedBy;
  List<Meta> metaData;
  Links lLinks;

  Coupon(
      {this.id,
      this.code,
      this.amount,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.discountType,
      this.description,
      this.dateExpires,
      this.dateExpiresGmt,
      this.usageCount,
      this.individualUse,
      this.productIds,
      this.excludedProductIds,
      this.usageLimit,
      this.usageLimitPerUser,
      this.limitUsageToXItems,
      this.freeShipping,
      this.productCategories,
      this.excludedProductCategories,
      this.excludeSaleItems,
      this.minimumAmount,
      this.maximumAmount,
      this.emailRestrictions,
      this.usedBy,
      this.metaData,
      this.lLinks});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    amount = json['amount'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    discountType = json['discount_type'];
    description = json['description'];
    dateExpires = json['date_expires'];
    dateExpiresGmt = json['date_expires_gmt'];
    usageCount = json['usage_count'];
    individualUse = json['individual_use'];
    productIds = json['product_ids'].cast<int>();
    excludedProductIds = json['excluded_product_ids'].cast<int>();
    usageLimit = json['usage_limit'];
    usageLimitPerUser = json['usage_limit_per_user'];
    limitUsageToXItems = json['limit_usage_to_x_items'];
    freeShipping = json['free_shipping'];
    productCategories = json['product_categories'].cast<int>();
    excludedProductCategories = json['excluded_product_categories'].cast<int>();
    excludeSaleItems = json['exclude_sale_items'];
    minimumAmount = json['minimum_amount'];
    maximumAmount = json['maximum_amount'];
    emailRestrictions = json['email_restrictions'].cast<String>();
    usedBy = json['used_by'].cast<String>();
    if (json['meta_data'] != null) {
      metaData = new List<Meta>();
      json['meta_data'].forEach((v) {
        metaData.add(new Meta.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['amount'] = this.amount;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['discount_type'] = this.discountType;
    data['description'] = this.description;
    data['date_expires'] = this.dateExpires;
    data['date_expires_gmt'] = this.dateExpiresGmt;
    data['usage_count'] = this.usageCount;
    data['individual_use'] = this.individualUse;
    data['product_ids'] = this.productIds;
    data['excluded_product_ids'] = this.excludedProductIds;
    data['usage_limit'] = this.usageLimit;
    data['usage_limit_per_user'] = this.usageLimitPerUser;
    data['limit_usage_to_x_items'] = this.limitUsageToXItems;
    data['free_shipping'] = this.freeShipping;
    data['product_categories'] = this.productCategories;
    data['excluded_product_categories'] = this.excludedProductCategories;
    data['exclude_sale_items'] = this.excludeSaleItems;
    data['minimum_amount'] = this.minimumAmount;
    data['maximum_amount'] = this.maximumAmount;
    data['email_restrictions'] = this.emailRestrictions;
    data['used_by'] = this.usedBy;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }

  @override
  String toJsonString() {
    return json.encode(this);
  }
}

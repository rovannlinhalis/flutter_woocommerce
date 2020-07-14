import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:r_flutter_woocommerce/models/generic/meta.dart';
import 'package:r_flutter_woocommerce/models/products/attributes/attributes.dart';
import 'package:r_flutter_woocommerce/models/products/download.dart';
import 'package:r_flutter_woocommerce/models/products/dimension.dart';
import 'package:r_flutter_woocommerce/models/products/image.dart';
import 'package:r_flutter_woocommerce/models/generic/link.dart';

class Variation extends BaseModel {
  int id;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  String description;
  String permalink;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  Null dateOnSaleFrom;
  Null dateOnSaleFromGmt;
  Null dateOnSaleTo;
  Null dateOnSaleToGmt;
  bool onSale;
  String status;
  bool purchasable;
  bool virtual;
  bool downloadable;
  List<ProductDownload> downloads;
  int downloadLimit;
  int downloadExpiry;
  String taxStatus;
  String taxClass;
  bool manageStock;
  Null stockQuantity;
  String stockStatus;
  String backorders;
  bool backordersAllowed;
  bool backordered;
  String weight;
  Dimensions dimensions;
  String shippingClass;
  int shippingClassId;
  Image image;
  List<ProductAttribute> attributes;
  int menuOrder;
  List<Meta> metaData;
  Links lLinks;

  Variation(
      {this.id,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.description,
      this.permalink,
      this.sku,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.dateOnSaleFrom,
      this.dateOnSaleFromGmt,
      this.dateOnSaleTo,
      this.dateOnSaleToGmt,
      this.onSale,
      this.status,
      this.purchasable,
      this.virtual,
      this.downloadable,
      this.downloads,
      this.downloadLimit,
      this.downloadExpiry,
      this.taxStatus,
      this.taxClass,
      this.manageStock,
      this.stockQuantity,
      this.stockStatus,
      this.backorders,
      this.backordersAllowed,
      this.backordered,
      this.weight,
      this.dimensions,
      this.shippingClass,
      this.shippingClassId,
      this.image,
      this.attributes,
      this.menuOrder,
      this.metaData,
      this.lLinks});

  Variation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    description = json['description'];
    permalink = json['permalink'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    dateOnSaleFrom = json['date_on_sale_from'];
    dateOnSaleFromGmt = json['date_on_sale_from_gmt'];
    dateOnSaleTo = json['date_on_sale_to'];
    dateOnSaleToGmt = json['date_on_sale_to_gmt'];
    onSale = json['on_sale'];
    status = json['status'];
    purchasable = json['purchasable'];
    virtual = json['virtual'];
    downloadable = json['downloadable'];
    if (json['downloads'] != null) {
      downloads = new List<Null>();
      json['downloads'].forEach((v) {
        downloads.add(new ProductDownload.fromJson(v));
      });
    }
    downloadLimit = json['download_limit'];
    downloadExpiry = json['download_expiry'];
    taxStatus = json['tax_status'];
    taxClass = json['tax_class'];
    manageStock = json['manage_stock'];
    stockQuantity = json['stock_quantity'];
    stockStatus = json['stock_status'];
    backorders = json['backorders'];
    backordersAllowed = json['backorders_allowed'];
    backordered = json['backordered'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    if (json['attributes'] != null) {
      attributes = new List<ProductAttribute>();
      json['attributes'].forEach((v) {
        attributes.add(new ProductAttribute.fromJson(v));
      });
    }
    menuOrder = json['menu_order'];
    if (json['meta_data'] != null) {
      metaData = new List<Null>();
      json['meta_data'].forEach((v) {
        metaData.add(new Meta.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['description'] = this.description;
    data['permalink'] = this.permalink;
    data['sku'] = this.sku;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['date_on_sale_from'] = this.dateOnSaleFrom;
    data['date_on_sale_from_gmt'] = this.dateOnSaleFromGmt;
    data['date_on_sale_to'] = this.dateOnSaleTo;
    data['date_on_sale_to_gmt'] = this.dateOnSaleToGmt;
    data['on_sale'] = this.onSale;
    data['status'] = this.status;
    data['purchasable'] = this.purchasable;
    data['virtual'] = this.virtual;
    data['downloadable'] = this.downloadable;
    if (this.downloads != null) {
      data['downloads'] = this.downloads.map((v) => v.toJson()).toList();
    }
    data['download_limit'] = this.downloadLimit;
    data['download_expiry'] = this.downloadExpiry;
    data['tax_status'] = this.taxStatus;
    data['tax_class'] = this.taxClass;
    data['manage_stock'] = this.manageStock;
    data['stock_quantity'] = this.stockQuantity;
    data['stock_status'] = this.stockStatus;
    data['backorders'] = this.backorders;
    data['backorders_allowed'] = this.backordersAllowed;
    data['backordered'] = this.backordered;
    data['weight'] = this.weight;
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions.toJson();
    }
    data['shipping_class'] = this.shippingClass;
    data['shipping_class_id'] = this.shippingClassId;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    data['menu_order'] = this.menuOrder;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

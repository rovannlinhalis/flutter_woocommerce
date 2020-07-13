import 'package:r_flutter_woocommerce/models/customers/file.dart';
import 'package:r_flutter_woocommerce/models/generic/link.dart';

class CustomerDownload {
  String downloadId;
  String downloadUrl;
  int productId;
  String productName;
  String downloadName;
  int orderId;
  String orderKey;
  String downloadsRemaining;
  String accessExpires;
  String accessExpiresGmt;
  File file;
  Links lLinks;

  CustomerDownload(
      {this.downloadId,
      this.downloadUrl,
      this.productId,
      this.productName,
      this.downloadName,
      this.orderId,
      this.orderKey,
      this.downloadsRemaining,
      this.accessExpires,
      this.accessExpiresGmt,
      this.file,
      this.lLinks});

  CustomerDownload.fromJson(Map<String, dynamic> json) {
    downloadId = json['download_id'];
    downloadUrl = json['download_url'];
    productId = json['product_id'];
    productName = json['product_name'];
    downloadName = json['download_name'];
    orderId = json['order_id'];
    orderKey = json['order_key'];
    downloadsRemaining = json['downloads_remaining'];
    accessExpires = json['access_expires'];
    accessExpiresGmt = json['access_expires_gmt'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['download_id'] = this.downloadId;
    data['download_url'] = this.downloadUrl;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['download_name'] = this.downloadName;
    data['order_id'] = this.orderId;
    data['order_key'] = this.orderKey;
    data['downloads_remaining'] = this.downloadsRemaining;
    data['access_expires'] = this.accessExpires;
    data['access_expires_gmt'] = this.accessExpiresGmt;
    if (this.file != null) {
      data['file'] = this.file.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}




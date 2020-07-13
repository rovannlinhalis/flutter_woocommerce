import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:r_flutter_woocommerce/models/generic/link.dart';

class OrderNote  extends BaseModel {
  int id;
  String author;
  String dateCreated;
  String dateCreatedGmt;
  String note;
  bool customerNote;
  Links lLinks;

  OrderNote(
      {this.id,
      this.author,
      this.dateCreated,
      this.dateCreatedGmt,
      this.note,
      this.customerNote,
      this.lLinks});




  OrderNote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    note = json['note'];
    customerNote = json['customer_note'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['author'] = this.author;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['note'] = this.note;
    data['customer_note'] = this.customerNote;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

import 'package:flutter_woocommerce/models/generic/href.dart';

class Links {
  List<HRef> self;
  List<HRef> collection;
  List<HRef> up;

  Links({this.self, this.collection, this.up});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = new List<HRef>();
      json['self'].forEach((v) {
        self.add(new HRef.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = new List<HRef>();
      json['collection'].forEach((v) {
        collection.add(new HRef.fromJson(v));
      });
    }
    if (json['up'] != null) {
      up = new List<HRef>();
      json['up'].forEach((v) {
        up.add(new HRef.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection.map((v) => v.toJson()).toList();
    }
    if (this.up != null) {
      data['up'] = this.up.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
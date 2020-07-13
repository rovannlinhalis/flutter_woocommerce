
import 'package:r_flutter_woocommerce/models/base/baseModel.dart';
import 'package:meta/meta.dart';


typedef S ItemCreator<S>();


class BatchGeneric<T extends BaseModel> {
  List<T> create;
  List<T> update;
  List<int> delete;


  ItemCreator<T> creator;

  BatchGeneric({@required this.creator, this.create, this.update, this.delete});

  BatchGeneric.fromJson(Map<String, dynamic> json) {
    if (json['create'] != null) {
      create = new List<T>();
      json['create'].forEach((v) {
        dynamic obj = creator();
        create.add(obj.fromJson(v));
      });
    }
    if (json['update'] != null) {
      update = new List<T>();
      json['update'].forEach((v) {
        dynamic obj = creator();
        update.add(obj.fromJson(v));
      });
    }
    delete = json['delete'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.create != null) {
      data['create'] = this.create.map((v) => v.toJson()).toList();
    }
    if (this.update != null) {
      data['update'] = this.update.map((v) => v.toJson()).toList();
    }
    data['delete'] = this.delete;
    return data;
  }
}
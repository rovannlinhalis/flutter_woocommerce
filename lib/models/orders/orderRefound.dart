class OrderRefound {
  int id;
  String reason;
  String total;

  OrderRefound({this.id, this.reason, this.total});

  OrderRefound.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reason = json['reason'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reason'] = this.reason;
    data['total'] = this.total;
    return data;
  }
}
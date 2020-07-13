class ProductDownload {
  int id;
  String name;
  String file;

  ProductDownload({this.id, this.name, this.file});

  ProductDownload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['file'] = this.file;
    return data;
  }
}
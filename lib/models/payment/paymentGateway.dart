import 'package:flutter_woocommerce/models/base/baseModel.dart';
import 'package:flutter_woocommerce/models/generic/link.dart';
import 'package:flutter_woocommerce/models/payment/settings.dart';

class PaymentGateway extends BaseModel {
	String id;
	String title;
	String description;
	int order;
	bool enabled;
	String methodTitle;
	String methodDescription;
	List<String> methodSupports;
	PaymentSettings settings;
	Links lLinks;

	PaymentGateway({this.id, this.title, this.description, this.order, this.enabled, this.methodTitle, this.methodDescription, this.methodSupports, this.settings, this.lLinks});

	PaymentGateway.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		title = json['title'];
		description = json['description'];
		order = json['order'];
		enabled = json['enabled'];
		methodTitle = json['method_title'];
		methodDescription = json['method_description'];
		methodSupports = json['method_supports'].cast<String>();
		settings = json['settings'] != null ? new PaymentSettings.fromJson(json['settings']) : null;
		lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['title'] = this.title;
		data['description'] = this.description;
		data['order'] = this.order;
		data['enabled'] = this.enabled;
		data['method_title'] = this.methodTitle;
		data['method_description'] = this.methodDescription;
		data['method_supports'] = this.methodSupports;
		if (this.settings != null) {
      data['settings'] = this.settings.toJson();
    }
		if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
		return data;
	}
}



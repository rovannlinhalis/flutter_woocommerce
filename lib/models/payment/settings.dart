class SettingsValue {
  String id;
  String label;
  String description;
  String type;
  String value;
  String defaultValue;
  String tip;
  String placeholder;

  SettingsValue(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.defaultValue,
      this.tip,
      this.placeholder});

  SettingsValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = json['value'];
    defaultValue = json['default'];
    tip = json['tip'];
    placeholder = json['placeholder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['description'] = this.description;
    data['type'] = this.type;
    data['value'] = this.value;
    data['default'] = this.defaultValue;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class PaymentSettings {
  SettingsValue title;
  SettingsValue instructions;

  PaymentSettings({this.title, this.instructions});

  PaymentSettings.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null
        ? new SettingsValue.fromJson(json['title'])
        : null;
    instructions = json['instructions'] != null
        ? new SettingsValue.fromJson(json['instructions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.instructions != null) {
      data['instructions'] = this.instructions.toJson();
    }
    return data;
  }
}

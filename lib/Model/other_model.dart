import 'package:flutter/cupertino.dart';

class OtherModel {
  TextEditingController? fController;
  TextEditingController? sController;

  OtherModel({this.fController, this.sController});

  OtherModel.fromJson(Map<String, dynamic> json) {
    fController = TextEditingController(text: json['type']);
    sController = TextEditingController(text: json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = fController;
    data['value'] = sController;
    return data;
  }
}

class Other {
  String? type;
  String? value;

  Other({this.value, this.type});

  Other.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}

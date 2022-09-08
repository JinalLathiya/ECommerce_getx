import 'package:flutter/cupertino.dart';

import 'other_model.dart';

class ProductDetails {
  String id;
  String name;
  String value;
  TextEditingController controller = TextEditingController();
  List<OtherModel>? otherData;

  ProductDetails({
    required this.id,
    required this.name,
    required this.value,
    required this.controller,
    this.otherData,
  });
}

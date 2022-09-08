import 'dart:io';

import 'package:ecommerce_app_getx/Model/product_model.dart';
import 'package:ecommerce_app_getx/Providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../Model/other_model.dart';

class HomeController extends GetxController {
  //use in home page to store selected data
  RxList<ProductDetails> dataView = <ProductDetails>[].obs;
  List<ProductDetails> productData = [];
  RxList<Map> list = RxList<Map>([]);

  //other model
  RxList<OtherModel> otherText = RxList<OtherModel>([]);
  Rx<File>? imgFile;
  final _picker = ImagePicker();

  //save dropdown data
  List<MultiSelectItem> dropdownItem = [];

  TextEditingController color = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController mfgDate = TextEditingController();
  TextEditingController other = TextEditingController();
  TextEditingController s1 = TextEditingController();
  TextEditingController s2 = TextEditingController();
  TextEditingController s3 = TextEditingController();
  Map map = {};

  getData() {
    ProductHelper.initDB().then((data) {
      String s = "select * from Products";
      data.rawQuery(s).then((value) {
        print(value);
        list.value = value;
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  openCamera(void Function(void Function()) setState) async {
    var imgCamera = await _picker.pickImage(source: ImageSource.camera);
    imgFile = File(imgCamera!.path).obs;
    imgFile!.refresh();
    setState(() {});
  }

  openGallery(void Function(void Function()) setState) async {
    var imgGallery = await _picker.pickImage(source: ImageSource.gallery);
    imgFile = File(imgGallery!.path).obs;
    imgFile!.refresh();
    setState(() {});
  }

  displayImage(void Function(void Function()) setState) {
    if (imgFile?.value == null) {
      return const Text("No Image Selected!");
    } else {
      print("Test  := ${imgFile!.value.path}");
      setState(() {});
      return FileImage(imgFile!.value);
    }
  }

  getValue() {
    productData.clear();
    dropdownItem.clear();
    Map<String, dynamic> apiResponse = {
      "code": 200,
      "message": "Course subject lists.",
      "data": [
        {
          "id": "1",
          "name": "Color",
          "value": color.text,
          "controller": color,
        },
        {
          "id": "2",
          "name": "Size",
          "value": size.text,
          "controller": size,
        },
        {
          "id": "3",
          "name": "Height",
          "value": height.text,
          "controller": height,
        },
        {
          "id": "4",
          "name": "Width",
          "value": width.text,
          "controller": width,
        },
        {
          "id": "5",
          "name": "Weight",
          "value": weight.text,
          "controller": weight,
        },
        {
          "id": "6",
          "name": "Manufacture Date",
          "value": mfgDate.text,
          "controller": mfgDate,
        },
        {
          "id": "7",
          "name": "Other",
          "value": other.text,
          "controller": other,
        },
      ],
    };
    if (apiResponse['code'] == 200) {
      List<ProductDetails> tempProductData = [];
      apiResponse['data'].forEach((data) {
        tempProductData.add(ProductDetails(
          id: data['id'],
          name: data['name'],
          value: data["value"],
          controller: data["controller"],
        ));
      });
      print(tempProductData);
      productData.addAll(tempProductData);
      dropdownItem = productData.map((val) {
        return MultiSelectItem(val, val.name);
      }).toList();
      update();
    } else if (apiResponse['code'] == 400) {
      print("Error occurred..");
    } else {
      print("Something went wrong..");
    }
  }

  deleteImg() {
    GestureDetector(
      onTap: () {
        imgFile?.value.delete();
      },
    );
  }
}

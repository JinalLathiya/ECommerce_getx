import 'dart:convert';
import 'dart:typed_data';

import 'package:ecommerce_app_getx/Model/product_model.dart';
import 'package:ecommerce_app_getx/Providers/product_provider.dart';
import 'package:ecommerce_app_getx/Views/tile_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../Controllers/homeController.dart';
import '../Model/other_model.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List pData = [];
    dynamic m = ModalRoute.of(context)!.settings.arguments;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getValue();
    });
    GlobalKey<FormState> insertFormKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("ADD Product"),
        centerTitle: true,
        elevation: 0,
        leading: Container(),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: insertFormKey,
                  child: Column(
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) => GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    alignment: Alignment.center,
                                    height: 140,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          "choose profile photo",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Get.back();
                                                  controller
                                                      .openCamera(setState);
                                                },
                                                icon: const Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.black,
                                                  size: 50,
                                                )),
                                            IconButton(
                                              onPressed: () {
                                                Get.back();
                                                controller
                                                    .openGallery(setState);
                                              },
                                              icon: const Icon(
                                                Icons.photo_library_rounded,
                                                size: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: controller.imgFile == null
                              ? const CircleAvatar(
                                  radius: 80,
                                  backgroundColor: Colors.blueGrey,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 45,
                                    color: Colors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 80,
                                  backgroundImage:
                                      controller.displayImage(setState),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      formField(
                        controller: controller.s1,
                        labelText: "Name",
                        hintText: "Enter Product Name",
                        validator: (value) {
                          if (isNullEmptyOrFalse(value)) {
                            return "Please Enter product Name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      formField(
                        textInputType: TextInputType.number,
                        controller: controller.s2,
                        labelText: "Price",
                        hintText: "Enter Product Price",
                        validator: (value) {
                          if (isNullEmptyOrFalse(value)) {
                            return "Please Enter product Price";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      formField(
                        controller: controller.s3,
                        labelText: "Description",
                        hintText: "Enter Product Description",
                        validator: (value) {
                          if (isNullEmptyOrFalse(value)) {
                            return "Please Enter product Description";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      m == null
                          ? GetBuilder<HomeController>(
                              builder: (_) => MultiSelectDialogField(
                                items: controller.dropdownItem,
                                chipDisplay: MultiSelectChipDisplay(
                                  onTap: (val) {
                                    controller.dropdownItem.remove(val);
                                  },
                                ),
                                selectedColor: Colors.black,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                buttonIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                buttonText: const Text(
                                  "Select Attribute",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                onConfirm: (result) {
                                  pData = [];
                                  controller.dataView.clear();
                                  for (var i = 0; i < result.length; i++) {
                                    ProductDetails data =
                                        result[i] as ProductDetails;
                                    print(data.id);
                                    print(data.name);
                                    pData.add(data.id);
                                    controller.dataView.add(data);
                                  }
                                  print("data : $pData");
                                },
                                onSelectionChanged: (val) {
                                  for (var i = 0; i < val.length; i++) {
                                    ProductDetails data =
                                        val[i] as ProductDetails;
                                    print(data.id);
                                    print(data.name);
                                    pData.add(data.id);
                                    controller.dataView.add(data);
                                  }
                                },
                              ),
                            )
                          : Container(),
                      Obx(
                        () => Column(
                          children: List.generate(
                            controller.dataView.length,
                            (index) {
                              if (controller.dataView[index].name == "Color") {
                                return formField(
                                    hintText:
                                        "Enter${controller.dataView[index].name}",
                                    labelText: controller.dataView[index].name,
                                    controller: controller.color,
                                    textInputType: TextInputType.text,
                                    validator: (value) {
                                      if (isNullEmptyOrFalse(value)) {
                                        return "Enter Color";
                                      }
                                      return null;
                                    });
                              }
                              if (controller.dataView[index].name == "Size") {
                                return formField(
                                    hintText:
                                        "Enter${controller.dataView[index].name}",
                                    labelText: controller.dataView[index].name,
                                    controller: controller.size,
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      if (isNullEmptyOrFalse(value)) {
                                        return "Enter Size";
                                      }
                                      return null;
                                    });
                              }
                              if (controller.dataView[index].name == "Height") {
                                return formField(
                                    hintText:
                                        "Enter${controller.dataView[index].name}",
                                    labelText: controller.dataView[index].name,
                                    controller: controller.height,
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      if (isNullEmptyOrFalse(value)) {
                                        return "Enter Height";
                                      }
                                      return null;
                                    });
                              }
                              if (controller.dataView[index].name == "Width") {
                                return formField(
                                    hintText:
                                        "Enter${controller.dataView[index].name}",
                                    labelText: controller.dataView[index].name,
                                    controller: controller.width,
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      if (isNullEmptyOrFalse(value)) {
                                        return "Enter Width";
                                      }
                                      return null;
                                    });
                              }
                              if (controller.dataView[index].name == "Weight") {
                                return formField(
                                    hintText:
                                        "Enter${controller.dataView[index].name}",
                                    labelText: controller.dataView[index].name,
                                    controller: controller.weight,
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      if (isNullEmptyOrFalse(value)) {
                                        return "Enter Weight";
                                      }
                                      return null;
                                    });
                              }
                              if (controller.dataView[index].name ==
                                  "Manufacture Date") {
                                return formField(
                                    hintText:
                                        "Enter${controller.dataView[index].name}",
                                    labelText: controller.dataView[index].name,
                                    controller: controller.mfgDate,
                                    textInputType: TextInputType.text,
                                    validator: (value) {
                                      if (isNullEmptyOrFalse(value)) {
                                        return "Enter Manufacture Date";
                                      }
                                      return null;
                                    });
                              }
                              if (controller.dataView[index].name == 'Other') {
                                return Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        controller.otherText.add(OtherModel(
                                          fController: TextEditingController(),
                                          sController: TextEditingController(),
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                    Column(
                                      children: List.generate(
                                        controller.otherText.length,
                                        (index) {
                                          return Row(
                                            children: [
                                              Expanded(
                                                child: formField(
                                                    controller: controller
                                                        .otherText[index]
                                                        .fController!,
                                                    labelText: "Other Type",
                                                    hintText:
                                                        "Enter Other Type",
                                                    validator: (value) {
                                                      if (isNullEmptyOrFalse(
                                                          value)) {
                                                        return "Enter Other Type";
                                                      }
                                                      return null;
                                                    }),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  controller.otherText
                                                      .removeAt(index);
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                ),
                                              ),
                                              Expanded(
                                                child: formField(
                                                    controller: controller
                                                        .otherText[index]
                                                        .sController!,
                                                    labelText: "Other Value",
                                                    hintText:
                                                        "Enter Other Value",
                                                    validator: (value) {
                                                      if (isNullEmptyOrFalse(
                                                          value)) {
                                                        return "Enter Other Value";
                                                      }
                                                      return null;
                                                    }),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  m != null
                      ? const SizedBox()
                      : ElevatedButton(
                          onPressed: () {
                            controller.s1.clear();
                            controller.s2.clear();
                            controller.s3.clear();
                            controller.color.clear();
                            controller.size.clear();
                            controller.height.clear();
                            controller.width.clear();
                            controller.weight.clear();
                            controller.mfgDate.clear();
                            controller.other.clear();
                            controller.otherText.clear();
                            controller.dataView.clear();
                            controller.imgFile == null;
                          },
                          child: const Text(
                            "Clear",
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    child: Text(
                      m == null ? "ADD" : "Edit",
                      style: const TextStyle(
                        fontSize: 20,
                        letterSpacing: 3,
                      ),
                    ),
                    onPressed: () async {
                      if (insertFormKey.currentState!.validate()) {
                        Get.snackbar(
                          "Done",
                          "Validated",
                          backgroundColor: Colors.greenAccent,
                          colorText: Colors.black,
                        );
                      } else {
                        Get.snackbar(
                          "Alert",
                          "Not Validated",
                          backgroundColor: Colors.redAccent,
                          colorText: Colors.white,
                        );
                      }
                      Uint8List bytes =
                          controller.imgFile!.value.readAsBytesSync();
                      var encode = base64Encode(bytes);
                      String a = controller.s1.text;
                      String b = controller.s2.text;
                      String c = controller.s3.text;
                      String d = controller.color.text;
                      String e = controller.size.text;
                      String f = controller.height.text;
                      String g = controller.width.text;
                      String h = controller.weight.text;
                      String i = controller.mfgDate.text;
                      String j = controller.otherText
                          .map((element) {
                            return jsonEncode(Other(
                              type: element.fController?.text,
                              value: element.sController?.text,
                            ).toJson());
                          })
                          .toList()
                          .toString();
                      String o = encode;
                      ProductHelper.initDB().then((value) {
                        if (m == null) {
                          if (a != "" && b != "" && c != "" && d != "") {
                            ProductHelper.initDB().then((value) {
                              String q = "insert into Products("
                                  "s1,"
                                  "s2,"
                                  "s3,"
                                  "color,"
                                  "size,"
                                  "height,"
                                  "width,"
                                  "weight,"
                                  "mfg,"
                                  "other,"
                                  "image)"
                                  "values"
                                  "('$a','$b','$c','$d','$e','$f','$g','$h','$i','$j','$o')";
                              value.rawInsert(q).then((value) {
                                if (value >= 1) {
                                  print("Data Inserted");
                                  ProductHelper.initDB().then((value) {
                                    String s = "select * from Products";
                                    value.rawQuery(s).then((value) {
                                      print(value);
                                      controller.list.value = value;
                                    });
                                    Get.to(() => const TileDetailPage());
                                  });
                                }
                              });
                            });
                          }
                        } else {
                          String q =
                              "update Products set s1='$a',s2='$b',s3='$c',color='$d',size='$e',height='$f',width='$g',weight='$h',mfg='$i',other='$j' where id=${controller.map['id']}";
                          value.rawUpdate(q).then((value) {
                            if (value == 1) {
                              ProductHelper.initDB().then((value) {
                                String s = "select * from Products";
                                value.rawQuery(s).then((value) {
                                  print(value);
                                  controller.list.value = value;
                                });
                              });
                              print("Data updated");
                              Get.to(
                                () => const TileDetailPage(),
                              );
                            }
                          });
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  formField({
    required String hintText,
    required String labelText,
    required TextEditingController controller,
    FormFieldValidator? validator,
    TextInputType textInputType = TextInputType.text,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      margin: const EdgeInsets.all(5),
      child: Form(
        child: TextFormField(
          keyboardType: textInputType,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter the field';
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: labelText,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

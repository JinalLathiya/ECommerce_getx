import 'dart:convert';

import 'package:ecommerce_app_getx/Model/product_model.dart';
import 'package:ecommerce_app_getx/Providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/homeController.dart';
import '../Model/other_model.dart';
import 'detailsview.dart';
import 'homeview.dart';

class TileDetailPage extends GetWidget<HomeController> {
  const TileDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Data View'),
          centerTitle: true,
          leading: Container(),
        ),
        body: ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (context, index) {
            Map j = controller.list[index];
            return InkWell(
              onTap: () {
                Get.to( () =>
                  const DetailsPage(),
                  arguments: j,
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 55,
                      ),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: MemoryImage(base64Decode(j['image'])),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                            top: 60,
                            bottom: 20,
                          ),
                          child: Text(
                            "Name : ${j['s1']}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Price : ${j['s2']}/-",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (j != null) {
                              controller.map = j;
                              controller.s1.text = controller.map['s1'];
                              controller.s2.text = controller.map['s2'];
                              controller.s3.text = controller.map['s3'];
                              controller.color.text = controller.map['color'];
                              controller.size.text = controller.map['size'];
                              controller.height.text = controller.map['height'];
                              controller.width.text = controller.map['width'];
                              controller.weight.text = controller.map['weight'];
                              controller.mfgDate.text = controller.map['mfg'];
                              controller.other.clear();
                              List<dynamic> otherData =
                                  jsonDecode(controller.map['other']);
                              otherData.forEach((element) {
                                controller.otherText
                                    .add(OtherModel.fromJson(element));
                              });
                              controller.dataView.clear();
                              if (!isNullEmptyOrFalse(
                                controller.color.text,
                              )) {
                                controller.map = j;
                                controller.dataView.add(
                                  ProductDetails(
                                    name: "Color",
                                    value: controller.color.text,
                                    controller: controller.color,
                                    id: '1',
                                  ),
                                );
                              }
                              if (!isNullEmptyOrFalse(
                                controller.size.text,
                              )) {
                                controller.dataView.add(
                                  ProductDetails(
                                    name: "Size",
                                    value: controller.size.text,
                                    controller: controller.size,
                                    id: '2',
                                  ),
                                );
                              }
                              if (!isNullEmptyOrFalse(
                                controller.height.text,
                              )) {
                                controller.dataView.add(
                                  ProductDetails(
                                    name: "Height",
                                    value: controller.height.text,
                                    controller: controller.height,
                                    id: '3',
                                  ),
                                );
                              }
                              if (!isNullEmptyOrFalse(
                                controller.width.text,
                              )) {
                                controller.dataView.add(
                                  ProductDetails(
                                    name: "Width",
                                    value: controller.width.text,
                                    controller: controller.width,
                                    id: '4',
                                  ),
                                );
                              }
                              if (!isNullEmptyOrFalse(
                                controller.weight.text,
                              )) {
                                controller.dataView.add(
                                  ProductDetails(
                                    name: "Weight",
                                    value: controller.weight.text,
                                    controller: controller.weight,
                                    id: '5',
                                  ),
                                );
                              }
                              if (!isNullEmptyOrFalse(
                                controller.mfgDate.text,
                              )) {
                                controller.dataView.add(
                                  ProductDetails(
                                    name: "Mfg",
                                    value: controller.mfgDate.text,
                                    controller: controller.mfgDate,
                                    id: '6',
                                  ),
                                );
                              }
                              if (!isNullEmptyOrFalse(
                                controller.other.text,
                              )) {
                                controller.dataView.add(
                                  ProductDetails(
                                    id: '7',
                                    name: "Other",
                                    value: controller.other.text,
                                    controller: TextEditingController(
                                      text: controller.other.text,
                                    ),
                                  ),
                                );
                              }
                              Row(
                                  children: List.generate(
                                controller.otherText.length,
                                (index) {
                                  if (!isNullEmptyOrFalse(controller
                                      .otherText[index].fController!.text)) {
                                    controller.dataView.add(
                                      ProductDetails(
                                        id: "8",
                                        name: "Other Type",
                                        value: controller
                                            .otherText[index].fController!.text,
                                        controller: controller
                                            .otherText[index].fController!,
                                      ),
                                    );

                                    if (!isNullEmptyOrFalse(controller
                                        .otherText[index].sController!.text)) {
                                      controller.dataView.add(
                                        ProductDetails(
                                          id: "9",
                                          name: "Other Value",
                                          value: controller.otherText[index]
                                              .sController!.text,
                                          controller: controller
                                              .otherText[index].sController!,
                                        ),
                                      );
                                    }
                                  }
                                  return Container();
                                },
                              ));
                              Get.to( () => const HomePage(), arguments: j);
                            }
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            ProductHelper.initDB().then((value) {
                              String s =
                                  "delete from Products where id=${j['id']}";
                              value.rawDelete(s).then((value) {
                                if (value == 1) {
                                  controller.getData();
                                }
                              });
                            });
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() =>
              const HomePage(),
            );
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
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

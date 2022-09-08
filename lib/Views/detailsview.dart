import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/homeController.dart';

class DetailsPage extends GetWidget<HomeController> {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic s = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(
              "tile_details",
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 160,
              width: 160,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: MemoryImage(base64Decode(s['image'])),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    " Name : ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${s['s1']}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    " Price : ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${s['s2']}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    " Description : ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${s['s3']}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Obx(
                  () => Column(
                    children: const [],
                  ),
                );
              },
              child: Column(
                children: const [
                  Divider(
                    indent: 40,
                    endIndent: 40,
                    color: Colors.black,
                  ),
                  Text(
                    "Product Attributes",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Divider(
                    indent: 40,
                    endIndent: 40,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                s['color'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "Color : ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : const SizedBox(),
                s['color'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "${s['color']}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                s['size'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "Size : ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : const SizedBox(),
                s['size'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "${s['size']}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                s['height'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "Height :  ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : const SizedBox(),
                s['height'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "${s['height']}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                s['width'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "Width : ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : const SizedBox(),
                s['width'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "${s['width']}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                s['weight'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "Weight: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : const SizedBox(),
                s['weight'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "${s['weight']}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                s['mfg'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "MFG Date : ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : const SizedBox(),
                s['mfg'] != ""
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "${s['mfg']}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: jsonDecode(s['other']).length,
              itemBuilder: (context, index) {
                List<dynamic> list = jsonDecode(s['other']);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 20),
                      alignment: Alignment.center,
                      child: const Text(
                        "Other : ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${list[index]["type"]} - ${list[index]["value"]}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

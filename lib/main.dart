import 'package:ecommerce_app_getx/Bindings/homebinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Views/detailsview.dart';
import 'Views/homeview.dart';
import 'Views/tile_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'tile_details': (context) => const TileDetailPage(),
        'detail_page': (context) => const DetailsPage(),
      },
    );
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

import 'package:fake_store/utils/navigation.dart';
import 'package:fake_store/views/add_product_page.dart';
import 'package:fake_store/views/detail_product_page.dart';
import 'package:fake_store/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'data/models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        AddProductPage.routeName: (context) => AddProductPage(),
        DetailProductPage.routeName: (context) => DetailProductPage(
              product: ModalRoute.of(context)?.settings.arguments as Product,
            ),
      },
    );
  }
}

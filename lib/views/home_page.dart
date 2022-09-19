import 'package:fake_store/common/style.dart';
import 'package:fake_store/controllers/product_controller.dart';
import 'package:fake_store/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: Obx(
        () {
          if (productController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return ProductItem(
                    product: productController.productList[index]);
              },
            );
          }
        },
      ),
    );
  }
}

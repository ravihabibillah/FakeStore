import 'package:fake_store/common/style.dart';
import 'package:fake_store/controllers/product_controller.dart';
import 'package:fake_store/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/navigation.dart';
import 'add_update_product_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Product'),
      ),
      body: Obx(
        () {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (productController.noData.value) {
            return Center(
              child: Text(productController.message.value),
            );
          } else if (productController.hasData.value) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return ProductItem(
                    product: productController.productList[index]);
              },
            );
          } else if (productController.isError.value) {
            return Center(
              child: Text(productController.message.value),
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Product',
        backgroundColor: yellowColor,
        child: Icon(
          Icons.add,
          color: blackColor,
        ),
        onPressed: () {
          Navigation.intentWithoutData(AddUpdateProductPage.routeName);
        },
      ),
    );
  }
}

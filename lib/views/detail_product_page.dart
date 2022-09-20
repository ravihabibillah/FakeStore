import 'package:fake_store/common/style.dart';
import 'package:fake_store/utils/navigation.dart';
import 'package:fake_store/views/add_update_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import '../data/models/product.dart';

class DetailProductPage extends StatefulWidget {
  static const routeName = '/detail_product';

  const DetailProductPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
        leading: BackButton(
          color: blackColor,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: IconButton(
              icon: Icon(Icons.edit, color: greenColor,),
              onPressed: () {
                Navigation.intentWithProduct(AddUpdateProductPage.routeName, widget.product);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: IconButton(
              icon: Icon(Icons.delete, color: redColor,),
              onPressed: () {
                productController.removeProduct(widget.product.id!);
                Get.snackbar(
                  'Remove Product Message',
                  productController.message.value,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: grayColor,
                );
                Navigation.back();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image
            Hero(
              tag: widget.product.image,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: grayColor.withOpacity(0.2),
                  image: DecorationImage(
                    image: NetworkImage(widget.product.image),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Product Price
                      Text(
                        '\$${widget.product.price}',
                        style: boldStyle.copyWith(fontSize: 24),
                      ),
                      const Spacer(),

                      // Product Rate
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(top: 6, left: 6),
                        decoration: BoxDecoration(
                            // color: grayColor.withOpacity(0.6),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(color: grayColor)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.orange,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${widget.product.rating.rate}',
                              style: boldStyle,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Product Title
                  Text(
                    widget.product.title,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 14),

                  // Product Category
                  Row(
                    children: [
                      Text(
                        'Category ',
                        style: boldStyle,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: grayColor.withOpacity(0.4),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text('${widget.product.category?.capitalize}'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Product Description
                  Text(
                    widget.product.description,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

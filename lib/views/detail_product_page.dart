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
        title: Text('Detail Product'),
        actions: [
          Container(
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigation.intentWithProduct(AddUpdateProductPage.routeName, widget.product);
              },
            ),
            margin: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.delete),
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
            margin: EdgeInsets.symmetric(horizontal: 5.0),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: grayColor.withOpacity(0.2),
                image: DecorationImage(
                  image: NetworkImage(widget.product.image),
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
                      Spacer(),

                      // Product Rate
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 6, left: 6),
                        decoration: BoxDecoration(
                            // color: grayColor.withOpacity(0.6),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(color: grayColor)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.orange,
                            ),
                            SizedBox(
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
                  SizedBox(height: 14),

                  // Product Title
                  Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 14),

                  // Product Category
                  Row(
                    children: [
                      Text(
                        'Category ',
                        style: boldStyle,
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: grayColor.withOpacity(0.4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text('${widget.product.category?.capitalize}'),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  // Product Descrioption
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

import 'package:fake_store/common/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/product.dart';

class DetailProductPage extends StatelessWidget {
  static const routeName = '/detail_product';

  const DetailProductPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
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
                  image: NetworkImage(product.image),
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
                        '\$${product.price}',
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
                          border: Border.all(color: grayColor)
                        ),
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
                              '${product.rating.rate}',
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
                    product.title,
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
                        child: Text('${product.category?.capitalize}'),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  // Product Descrioption
                  Text(
                    product.description,
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

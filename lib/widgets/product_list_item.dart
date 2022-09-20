import 'package:fake_store/utils/navigation.dart';
import 'package:fake_store/views/detail_product_page.dart';
import 'package:flutter/material.dart';

import '../common/style.dart';
import '../data/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigation.intentWithProduct(DetailProductPage.routeName, product);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // Image Product
                      Center(
                        child: Hero(
                          tag: product.image,
                          child: Image.network(
                            product.image,
                            width: 100,
                          ),
                        ),
                      ),

                      // Price
                      Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.only(top: 6, left: 6),
                        decoration: BoxDecoration(
                          color: grayColor.withOpacity(0.6),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          '\$${product.price}',
                          style: boldStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Title
                        Text(
                          product.title,
                          style: boldStyle.copyWith(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Product Description
                        Text(
                          product.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // Product Rate
                        Expanded(
                          child: Row(
                            children: [
                              const Spacer(),
                              const Icon(
                                Icons.star,
                                size: 16,
                              ),
                              const SizedBox(
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

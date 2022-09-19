import 'package:fake_store/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/style.dart';
import '../controllers/product_controller.dart';
import '../utils/navigation.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  static const routeName = '/add_product';

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _productFormKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  final ProductController productController = Get.put(ProductController());

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _productFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Form Judul
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    label: const Text('Title'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title required';
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),

              // Form Price
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _priceController,
                decoration: InputDecoration(
                    label: const Text('Price'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Price required';
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),

              // Form Deskripsi
              TextFormField(
                keyboardType: TextInputType.multiline,
                controller: _descriptionController,
                decoration: InputDecoration(
                    label: const Text('Description'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description required';
                  }
                },
                maxLength: 140,
                minLines: 4,
                maxLines: 5,
              ),
              const SizedBox(height: 30.0),

              // Form Image url
              TextFormField(
                keyboardType: TextInputType.url,
                controller: _imageUrlController,
                decoration: InputDecoration(
                    label: const Text('Image url'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Image url required';
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),

              // Button Submit
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: yellowColor),
                onPressed: () async {
                  if (_productFormKey.currentState!.validate()) {
                    Rating rating = Rating(rate: 0.0, count: 0);

                    Product product = Product(
                      title: _titleController.text,
                      price: double.parse(
                          _priceController.text.replaceAll(",", "")),
                      description: _descriptionController.text,
                      // category: category,
                      image: _imageUrlController.text,
                      rating: rating,
                    );
                    productController.addProduct(product);

                    Get.snackbar(
                      'Add Product Message',
                      productController.message.value,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: grayColor,
                    );

                    Navigation.back();
                  }
                },
                child: Text(
                  'Submit',
                  style: blackStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

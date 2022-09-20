import 'package:fake_store/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/style.dart';
import '../controllers/product_controller.dart';
import '../utils/navigation.dart';

class AddUpdateProductPage extends StatefulWidget {
  const AddUpdateProductPage({Key? key, this.product}) : super(key: key);

  static const routeName = '/add_product';

  final Product? product;

  @override
  State<AddUpdateProductPage> createState() => _AddUpdateProductPageState();
}

class _AddUpdateProductPageState extends State<AddUpdateProductPage> {
  final _productFormKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  final ProductController productController = Get.put(ProductController());

  String? _selectedValueCategory;
  bool _isUpdate = false;

  @override
  void initState() {
    if (widget.product != null) {
      _titleController.text = widget.product!.title;
      _descriptionController.text = widget.product!.description;
      _priceController.text = widget.product!.price.toString();
      _imageUrlController.text = widget.product!.image;
      _selectedValueCategory = widget.product?.category;
      _isUpdate = true;
    }
    super.initState();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "men's clothing", child: Text("Men's Clothing")),
      const DropdownMenuItem(
          value: "women's clothing", child: Text("Women's Clothing")),
      const DropdownMenuItem(value: "jewelery", child: Text("Jewelry")),
      const DropdownMenuItem(value: "electronics", child: Text("Electronics")),
    ];
    return menuItems;
  }

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
        title: Text(
          _isUpdate ? "Edit Product" : "Add Product",
          // style: blackStyle,
        ),
        leading: BackButton(
          color: blackColor,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _productFormKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
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
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField(
                  items: dropdownItems,
                  value: _selectedValueCategory,
                  onChanged: (newValue) {
                    _selectedValueCategory = newValue;
                  },
                  decoration: InputDecoration(
                    label: const Text('Category'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Categoryy required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
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
                    return null;
                  },
                ),
                const SizedBox(
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
                    return null;
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
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),

                // Button Submit
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: yellowColor),
                  onPressed: () async {
                    if (_productFormKey.currentState!.validate()) {
                      Rating rating = Rating(rate: 0.0, count: 0);

                      Product data = Product(
                          title: _titleController.text,
                          price: double.parse(
                              _priceController.text.replaceAll(",", "")),
                          description: _descriptionController.text,
                          image: _imageUrlController.text,
                          rating: rating,
                          category: _selectedValueCategory);

                      if (!_isUpdate) {
                        await productController.addProduct(data);
                      } else {
                        data.id = widget.product?.id;
                        await productController.updateProduct(data);
                      }

                      Get.snackbar(
                        _isUpdate
                            ? 'Update Product Message'
                            : 'Add Product Message',
                        productController.message.value,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: grayColor,
                      );

                      Navigation.back();
                    }
                  },
                  child: Text(
                    'Submit',
                    style: boldStyle,
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

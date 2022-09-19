import 'package:fake_store/data/service/api_service.dart';
import 'package:get/get.dart';
import '../data/models/product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await ApiService.fetchProducts();
      if(products.isNotEmpty) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }

  }
}

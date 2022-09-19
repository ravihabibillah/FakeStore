import 'package:fake_store/data/service/api_service.dart';
import 'package:get/get.dart';
import '../data/models/product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;
  var hasData = false.obs;
  var noData = true.obs;
  var message = ''.obs;

  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<dynamic> fetchProducts() async {
    isLoading(true);
    isError(false);
    hasData(false);
    noData(true);
    try {
      var products = await ApiService.fetchProducts();
      if (products.isNotEmpty) {
        productList.value = products;
        isLoading(false);
        hasData(true);
        noData(false);
      } else if (noData.value) {
        message.value = 'There is no data';
      }
    } catch (e) {
      isLoading(false);
      isError(true);
      return message.value = 'No internet connection';
    }
  }

  Future<dynamic> addProduct(Product data) async {
    isError(false);
    isLoading(true);
    try {
      var isSuccess = await ApiService.addProduct(data);
      if (isSuccess) {
        message.value = 'Add product success';
        isLoading(false);
      } else {
        message.value = 'Failed to add product';
      }
    } catch (e) {
      isLoading(false);
      isError(true);
      return message.value = 'No internet connection';
    }
  }


}

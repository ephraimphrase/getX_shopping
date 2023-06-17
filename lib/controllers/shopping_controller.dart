import 'package:get/state_manager.dart';
import 'package:shopping_app/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    var productResult = [
      Product(id: 1, productName: 'FirstProd', productImage: 'abd', productDescription: 'some description', price: 30),
      Product(id: 1, productName: 'SecProd', productImage: 'abd', productDescription: 'some description', price: 40),
      Product(id: 1, productName: 'ThirdProd', productImage: 'abd', productDescription: 'some description', price: 49.5)
    ];

    products.value = productResult;
  }
}
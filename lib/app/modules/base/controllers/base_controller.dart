import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../cart/controllers/cart_controller.dart';

class BaseController extends GetxController {

  // current screen index
  int currentIndex = 0;

  // to count the number of products in the cart
  int cartItemsCount = 0;

  @override
  void onInit() {
    getCartItemsCount();
    super.onInit();
  }

  /// change the selected screen index
  changeScreen(int selectedIndex) {
    currentIndex = selectedIndex;
    update();
  }

  /// calculate the number of products in the cart
  getCartItemsCount() {
    var products = DummyHelper.products;
    cartItemsCount = products.fold<int>(0, (p, c) => p + c.quantity);
    update(['CartBadge']);
  }

  /// when the user press on add + icon
  onIncreasePressed(int productId) {
    DummyHelper.products.firstWhere((p) => p.id == productId).quantity++;
    getCartItemsCount();
    update(['ProductQuantity']);
  }

  /// when the user press on remove - icon
  onDecreasePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    if (product.quantity > 0) {
      product.quantity--;
      getCartItemsCount();
      if (Get.isRegistered<CartController>()) {
        Get.find<CartController>().getCartProducts();
      }
      update(['ProductQuantity']);
    }
  }

}

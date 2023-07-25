import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';
import '../../cart/controllers/cart_controller.dart';

class ProductDetailsController extends GetxController {

  // get product details from arguments
  ProductModel product = Get.arguments;

  /// when the user press on add to cart button
  onAddToCartPressed() {
    // var mProduct = DummyHelper.products.firstWhere((p) => p.id == product.id);
    // mProduct.quantity = mProduct.quantity + 1;
    // Get.find<CartController>().getCartProducts();
    // Get.back();
  }

}

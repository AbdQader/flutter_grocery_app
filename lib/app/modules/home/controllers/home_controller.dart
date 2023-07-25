import 'package:get/get.dart';

import '../../../../config/theme/my_theme.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/dummy_helper.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {

  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  var cards = [Constants.card1, Constants.card2, Constants.card3];
  var isLightTheme = MySharedPref.getThemeIsLight();

  @override
  void onInit() {
    getCategories();
    getProducts();
    super.onInit();
  }

  /// when the user press on change theme icon
  onChangeThemePressed() {
    MyTheme.changeTheme();
    isLightTheme = MySharedPref.getThemeIsLight();
    update(['Theme']);
  }

  /// get categories from dummy helper
  getCategories() {
    categories = DummyHelper.categories;
  }

  /// get products from dummy helper
  getProducts() {
    products = DummyHelper.products;
  }
}

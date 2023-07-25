import '../app/data/models/category_model.dart';
import '../app/data/models/product_model.dart';
import 'constants.dart';

class DummyHelper {
  const DummyHelper._();

  static const _description = 'Ginger is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.';

  static List<Map<String, String>> cards = [
    {'icon': Constants.lotus, 'title': '100%', 'subtitle': 'Organic'},
    {'icon': Constants.calendar, 'title': '1 Year', 'subtitle': 'Expiration'},
    {'icon': Constants.favourites, 'title': '4.8 (256)', 'subtitle': 'Reviews'},
    {'icon': Constants.matches, 'title': '80 kcal', 'subtitle': '100 Gram'},
  ];

  static List<CategoryModel> categories = [
    CategoryModel(id: 1, title: 'Fruits', image: Constants.apple),
    CategoryModel(id: 2, title: 'Vegetables', image: Constants.broccoli),
    CategoryModel(id: 3, title: 'Cheeses', image: Constants.cheese),
    CategoryModel(id: 4, title: 'Meat', image: Constants.meat),
  ];

  static List<ProductModel> products = [
    ProductModel(
      id: 1,
      image: Constants.bellPepper,
      name: 'Bell Pepper Red',
      quantity: 0,
      price: 5.99,
      description: _description,
    ),
    ProductModel(
      id: 2,
      image: Constants.lambMeat,
      name: 'Lamb Meat',
      quantity: 0,
      price: 44.99,
      description: _description,
    ),
    ProductModel(
      id: 3,
      image: Constants.ginger,
      name: 'Arabic Ginger',
      quantity: 0,
      price: 4.99,
      description: _description,
    ),
    ProductModel(
      id: 4,
      image: Constants.cabbage,
      name: 'Fresh Lettuce',
      quantity: 0,
      price: 3.99,
      description: _description,
    ),
    ProductModel(
      id: 5,
      image: Constants.pumpkin,
      name: 'Butternut Squash',
      quantity: 0,
      price: 8.99,
      description: _description,
    ),
    ProductModel(
      id: 6,
      image: Constants.carrot,
      name: 'Organic Carrots',
      quantity: 0,
      price: 5.99,
      description: _description,
    ),
    ProductModel(
      id: 7,
      image: Constants.cauliflower,
      name: 'Fresh Broccoli',
      quantity: 0,
      price: 3.99,
      description: _description,
    ),
    ProductModel(
      id: 8,
      image: Constants.tomatoes,
      name: 'Cherry Tomato',
      quantity: 0,
      price: 5.99,
      description: _description,
    ),
    ProductModel(
      id: 9,
      image: Constants.spinach,
      name: 'Fresh Spinach',
      quantity: 0,
      price: 2.99,
      description: _description,
    ),
  ];

}
import 'package:my_restaurant/category_model.dart';
import 'package:my_restaurant/menu_model.dart';
import 'package:my_restaurant/my_restaurant_database.dart';

class MyRestaurantService {
  MyRestaurantService._();

  static final _instance = MyRestaurantService._();

  factory MyRestaurantService() => _instance;

  final database = MyRestaurantDatabase();

  Map<MenuModel, int> cart = {};

  List<CategoryModel> categories = [];

  void addMenuToCart(int id) {
    final map = database.findValueById(id.abs());
    if (map == null) return;

    final menu = MenuModel.fromMap(map);

    final shouldAdd = id > 0;

    if (shouldAdd && cart.containsKey(menu)) {
      cart[menu] = cart[menu]! + 1;
    } else if (shouldAdd) {
      cart.addAll({
        menu: 1,
      });
    } else if (cart.containsKey(menu)) {
      // Removing items
      cart[menu] = cart[menu]! > 0 ? cart[menu]! - 1 : 0;
    }
  }

  int? getQuantity(MenuModel menu) => cart[menu];

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (final entry in cart.entries) {
      totalPrice += (entry.key.price * entry.value);
    }
    return totalPrice;
  }

  List<CategoryModel> getAllCategories() {
    final values = database.categories.values;

    for (int i = 0; i < values.length; i++) {
      final value = values.elementAt(i) as Map<String, dynamic>;
      final categoryModel = CategoryModel.fromMap(value);
      categories.add(categoryModel);
    }

    return categories;
  }

  List<MenuModel> getMenuFromCategory(int categoryId) {
    return getAllMenus()
        .where((element) => element.categoryId == categoryId)
        .toList();
  }

  List<MenuModel> getAllMenus() {
    return database.menu.values
        .map((value) => MenuModel.fromMap(value))
        .toList();
  }
}

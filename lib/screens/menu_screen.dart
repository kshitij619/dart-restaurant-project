// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:my_restaurant/category_model.dart';
import 'package:my_restaurant/extensions/print_color_extension.dart';
import 'package:my_restaurant/menu_model.dart';
import 'package:my_restaurant/my_restaurant_service.dart';

void menuScreen() {
  print('Start\n');

  final service = MyRestaurantService();

  final categories = service.getAllCategories();

  print("\x1B[2J\x1B[0;0H");

  print('Welcome to Apna Restaurant!\n');

  int? input;
  while (input != 0) {
    print("\x1B[2J\x1B[0;0H");
    print('Select the item you want to order...');

    for (CategoryModel category in categories) {
      print(category.categoryName.magenta);
      final menus = service.getMenuFromCategory(category.categoryId);

      for (MenuModel menu in menus) {
        print('${menu.id}. ${menu.name}'.cyan.padRight(35, '.'.yellow) +
            '${menu.currency}${menu.price}'.green.padRight(20) +
            '${service.getQuantity(menu) ?? ''}');
      }

      print('');
    }

    print('Total price: '.yellow + '${service.calculateTotalPrice()}'.green);

    final inputString = stdin.readLineSync();
    input = int.tryParse(inputString ?? '');

    service.addMenuToCart(input ?? 999);
  }

  service.generateBill();

  service.payBill();
  print('');
}

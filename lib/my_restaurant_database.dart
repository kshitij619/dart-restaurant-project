class MyRestaurantDatabase {
  Map<int, dynamic> menu = {
    1: {
      'id': 1,
      'name': 'Margherita Pizza',
      'price': 99.00,
      'currency': '₹',
      'categoryId': 1,
    },
    2: {
      'id': 2,
      'name': 'Corn Cheese Pizza',
      'price': 150.00,
      'currency': '₹',
      'categoryId': 1,
    },
    3: {
      'id': 3,
      'name': 'Red Pasta',
      'price': 99.00,
      'currency': '₹',
      'categoryId': 2,
    },
    4: {
      'id': 4,
      'name': 'White Pasta',
      'price': 110.00,
      'currency': '₹',
      'categoryId': 2,
    },
    5: {
      'id': 5,
      'name': 'Roasted Pasta',
      'price': 89.00,
      'currency': '₹',
      'categoryId': 2,
    },
    6: {
      'id': 6,
      'name': 'Cold Drink',
      'price': 20.00,
      'currency': '₹',
      'categoryId': 3,
    },
  };

  Map<int, dynamic> categories = {
    1: {
      'categoryId': 1,
      'categoryName': 'Pizza',
      'description':
          'Pizza is an Italian dish of flattened bread dough baked with toppings and served hot'
    },
    2: {
      'categoryId': 2,
      'categoryName': 'Pasta',
      'description':
          'Pasta is a staple food in many countries and is often associated with Italian cuisine'
    },
    3: {
      'categoryId': 3,
      'categoryName': 'Drink',
      'description': '',
    },
  };

  Map<String, dynamic>? findValueById(int id) {
    return menu[id];
  }
}

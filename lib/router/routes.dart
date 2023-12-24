import 'package:okiapp/features/Product_detail/view/Products_Screen.dart';
import 'package:okiapp/features/Product_list/view/Product_list.dart';

final routes = {
  '/': (context) => const CategoryList(title: 'Окинава'),
  '/Products': (context) => ProductsScreen(),
};

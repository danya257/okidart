import 'package:okiapp/features/Product_detail/view/Products_Screen.dart';
import 'package:okiapp/features/Category_list/view/Category_list.dart';

final routes = {
  '/': (context) => const CategoryScreen(),
  '/Products': (context) => const ProductsScreen(
        categoryId: 2,
        categoryName: '',
      ),
};

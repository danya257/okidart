import 'package:okiapp/repositories/category_detail/category_repository.dart';
import 'package:okiapp/repositories/category_detail/models/category_model.dart';

Future<List<Category>> getCategoryFromCategoryId(int categoryId) async {
  final category = await CategoryRepository().getCategoryList();
  return category;
}

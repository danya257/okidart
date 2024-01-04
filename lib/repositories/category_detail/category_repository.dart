import 'package:okiapp/repositories/category_detail/models/category_model.dart';
import 'package:dio/dio.dart';

class CategoryRepository {
  List<Category>? list; // переменная для списка категорий

  Future<List<Category>> getCategoryList() async {
    final response = await Dio().get('http://localhost:8000/api/categories');

    final data = response.data as Map<String, dynamic>;
    final result = data['results'] as List;

    final categoriesList = result.map((e) {
      final id = e['id'] as int;
      return Category(
        name: e['name'] as String,
        id: id,
      );
    });

    return list = categoriesList.toList();
  }

  getCategoryFromCategoryId(categoryId) {}
}

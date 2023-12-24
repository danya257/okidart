import 'package:okiapp/repositories/product_detail/models/products_model.dart';
import 'package:dio/dio.dart';

class ProductsRepository {
  Future<List<Categories>> getProductList() async {
    final response =
        await Dio().get('http://localhost:8000/api/categories?format=json');

    final data = response.data as Map<String, dynamic>;
    final result = data['results'] as List;
    final categoriesList = result.map((e) => Categories(
          name: e['name'] as String,
          slug: (e['slug'] as String),
          id: e['id'] as int,
        ));

    return categoriesList.toList();
  }
}

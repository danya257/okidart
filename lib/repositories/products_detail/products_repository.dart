import 'package:dio/dio.dart';
import 'package:okiapp/features/Product_detail/Products_Screen_detail.dart';
import 'package:okiapp/repositories/category_detail/models/category_model.dart';
import 'package:okiapp/repositories/products_detail/models/products_model.dart';

class ProductsRepository {
  Future<List<Products>> getProductDetailByCategory(int categoryId) async {
    final response =
        await Dio().get('http://localhost:8000/api/categories/$categoryId');

    final data = response.data as Map<String, dynamic>;
    final result = data['results'] as List;
    final productList = result
        .map((e) => Products(
              name: e['name'] as String,
              description: e['description'] as String,
              price: e['price'] as String,
            ))
        .toList();
    return productList;
  }
}

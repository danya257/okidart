import 'package:okiapp/features/models/Product_detail.dart';
import 'package:dio/dio.dart';

class ProductsRepository {
  Future<List<Products>> getProductDetail() async {
    final response =
        await Dio().get('http://localhost:8000/api/products?format=json');

    final data = response.data as Map<String, dynamic>;
    final result = data['results'] as List;
    final ProductList = result.map((e) => Products(
          name: e['name'] as String,
          slug: (e['slug'] as String),
          id: e['id'] as int,
          description: e['description'] as String,
          price: e['price'] as int,
        ));

    return ProductList.toList();
  }
}

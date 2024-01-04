import 'package:flutter/material.dart';
import 'package:okiapp/repositories/products_detail/models/products_model.dart';
import 'package:okiapp/repositories/products_detail/products_repository.dart';

class ProductsScreen extends StatefulWidget {
  final int categoryId;
  const ProductsScreen({
    Key? key,
    required this.categoryId,
    required String categoryName,
  }) : super(key: key);
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? productName;
  Future<List<Products>>? productList;

  @override
  void initState() {
    super.initState();
    fetchProductList();
  }

  void fetchProductList() {
    productList =
        ProductsRepository().getProductDetailByCategory(widget.categoryId);
    print(productList);
  }

  @override
  Widget build(BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyLarge;
    final large = Theme.of(context).textTheme.bodyMedium;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productName ?? 'Меню',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4141FF),
      ),
      body: FutureBuilder<List<Products>>(
        future: productList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.hasData) {
            final productList = snapshot.data!;

            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];

                return ListTile(
                  title: Text(
                    product.name,
                    style: medium,
                  ),
                  subtitle: Text(
                    product.description,
                    style: large,
                  ),
                  trailing: Text('\₽ ${product.price}'),
                );
              },
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}

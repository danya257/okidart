import 'package:flutter/material.dart';
import 'package:okiapp/features/Product_list/widgets/Product_tile.dart';
import 'package:okiapp/repositories/product_detail/models/products_model.dart';
import 'package:okiapp/repositories/product_detail/products_repository.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Categories>? _categoryList;

  @override
  Widget build(BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyText1;
    final large = Theme.of(context).textTheme.bodyText2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4141FF),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: (_categoryList == null)
          ? const SizedBox()
          : ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _categoryList!.length,
              itemBuilder: (context, i) {
                final categories = _categoryList![i];
                final categoriesName = categories.name;

                return ProductTile(
                  medium: medium,
                  large: large,
                  categoriesName: categoriesName,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
          _categoryList =
              (await ProductsRepository().getProductList()).cast<Categories>();
          setState(() {});
        },
      ),
    );
  }
}

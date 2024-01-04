import 'package:flutter/material.dart';
import 'package:okiapp/features/Product_detail/Products_Screen_detail.dart';
import 'package:okiapp/repositories/category_detail/models/category_model.dart';
import 'package:okiapp/repositories/category_detail/category_repository.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyLarge;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4141FF),
        title: Text(
          'Меню',
          style: medium,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: FutureBuilder(
          future: CategoryRepository().getCategoryList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final categories = snapshot.data as List<Category>;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductsScreen(
                            categoryId: categories[index].id,
                            categoryName: categories[index].name,
                          ),
                        ),
                      );
                      print(categories[index].id);
                    },
                    title: Text(
                      categories[index].name,
                      style: medium,
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

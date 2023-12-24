import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.categoriesName,
    required this.medium,
    required this.large,
  }) : super(key: key);

  final String categoriesName;
  final TextStyle? medium;
  final TextStyle? large;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/png/favicon.svg',
        height: 25,
        width: 30,
      ),
      title: Text(
        categoriesName,
        style: medium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/Products',
          arguments: categoriesName,
        );
      },
    );
  }
}

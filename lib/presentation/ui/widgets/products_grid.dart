import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';
import '../home/widgets/product/product_card_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
    required this.deleteItem,
  });

  final List<Product> products;
  final void Function(int productID) deleteItem;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 100),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          mainAxisExtent: 280,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return ProductCardItem(
            product: product,
            deleteItem: () => deleteItem(product.id!),
          );
        });
  }
}

import 'package:flutter/material.dart';

import '../../../../../data/models/product_model.dart';
import 'product_card_category.dart';
import 'product_card_image.dart';
import 'product_card_rate_and_price.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.deleteItem,
    required this.product,
  });

  final Product product;

  final void Function()? deleteItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.deepPurple,
      elevation: 2,
      //surfaceTintColor: Colors.black,

      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductCardImage(
              image: product.image,
              deleteItem: deleteItem,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductCardCategory(
                      category: product.category,
                    ),
                    Expanded(
                      child: Text(
                        product.title ?? "",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ProductCardRateAndPrice(
                        price: product.price, rating: product.rating?.rate),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

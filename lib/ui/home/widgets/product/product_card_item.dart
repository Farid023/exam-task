import 'package:flutter/material.dart';

import 'product_card_category.dart';
import 'product_card_image.dart';
import 'product_card_rate_and_price.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.category,
    required this.deleteItem,
  });

  final String? image;
  final String? title;
  final double? price;
  final double? rating;
  final String? category;
  final  Function() deleteItem;

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
              image: image,
              deleteItem: deleteItem,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductCardCategory(
                      category: category,
                    ),
                    Expanded(
                      child: Text(
                        "$title",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ProductCardRateAndPrice(price: price, rating: rating),
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

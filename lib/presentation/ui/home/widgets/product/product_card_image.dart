import 'package:flutter/material.dart';

import 'product_card_delete_button.dart';

class ProductCardImage extends StatelessWidget {
  const ProductCardImage({
    super.key,
    required this.image,
    required this.deleteItem,
  });

  final String? image;
  final void Function()? deleteItem;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.network(
              "$image",
              fit: BoxFit.fill,
              height: 125,
              width: 125,
            ),
          ),
          ProductCardDeleteBtn(
            deleteItem: deleteItem,
          ),
        ],
      ),
    );
  }
}

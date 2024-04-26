import 'package:flutter/material.dart';

class ProductCardDeleteBtn extends StatelessWidget {
  const ProductCardDeleteBtn({super.key, required this.deleteItem});

  final void Function()? deleteItem;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.purple,
          elevation: 10),
      onPressed: deleteItem,
      icon: const Icon(Icons.delete_forever),
    );
  }
}

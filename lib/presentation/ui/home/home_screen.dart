import 'package:e_commerce_task/presentation/ui/home/widgets/product/products_view.dart';
import 'package:flutter/material.dart';

import 'widgets/app_bar_cart_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static int? deletedItemsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: const [
          AppBarCartButton(),
        ],
      ),
      body: const ProductsView(),
    );
  }
}

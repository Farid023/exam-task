import 'package:e_commerce_task/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/product_model.dart';
import '../../../../cubits/home/products/products_cubit.dart';
import '../../../widgets/products_grid.dart';


class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductsCubit>(context);
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsInitial || state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsFailure) {
          return Text(state.errorMessage);
        } else if (state is ProductsSuccess) {
          final List<Product> productList = state.data;
          return ProductsGrid(
            products: productList,
            deleteItem: (int productID) {
              cubit.deleteProduct(productID);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

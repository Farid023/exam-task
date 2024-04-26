import 'package:e_commerce_task/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../cubits/home/products/products_cubit.dart';
import '../widgets/products_grid.dart';

class TrashView extends StatelessWidget {
  const TrashView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          if (cubit.deletedProducts.isNotEmpty) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ProductsGrid(
                    products: cubit.deletedProducts,
                    deleteItem: (int productID) {
                      cubit.undoDeletedProduct(productID);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.redAccent,
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => cubit.removeAllFromTrash(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: const Center(
                            child: Text(
                              "Restore All",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Lottie.asset(
                AppAssets.emptyCart,

              ),
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}

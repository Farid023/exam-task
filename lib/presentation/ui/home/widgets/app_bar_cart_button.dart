import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/home/products/products_cubit.dart';
import '../../trash/trash_screen.dart';


class AppBarCartButton extends StatelessWidget {
  const AppBarCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: cubit,
                  child: const TrashScreen(),
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
        Positioned(
          right: 4,
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsSuccess &&
                  cubit.deletedProducts.isNotEmpty) {
                return Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      cubit.deletedProducts.length.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        )
      ],
    );
  }
}

import 'package:e_commerce_task/cubits/trash/trash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/trash/trash_state.dart';
import '../../data/models/product_model.dart';
import '../home/widgets/product/product_card_item.dart';

class TrashView extends StatelessWidget {
  const TrashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrashCubit, TrashState>(
      builder: (context, state) {
        if (state is TrashInitial || state is TrashInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TrashFailure) {
          return Text(state.errorMessage);
        } else if (state is TrashSuccess) {
          final List<Product> productList = state.data;
          return GridView.builder(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.only(bottom: 100),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 2,
                mainAxisExtent: 280,
              ),
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                Product product = productList[index];
                return ProductCardItem(
                  image: product.image,
                  title: product.title,
                  price: product.price,
                  rating: product.rating?.rate,
                  category: product.category,
                  deleteItem: () {
                    
                  },
                );
              });
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

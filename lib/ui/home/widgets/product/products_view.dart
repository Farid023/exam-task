import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/home/products/products_cubit.dart';
import '../../../../data/models/product_model.dart';
import 'product_card_item.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    //  final cubit = BlocProvider.of<ProductsCubit>(context);
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsInitial || state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsFailure) {
          return Text(state.errorMessage);
        } else if (state is ProductsSuccess) {
          final cubit = BlocProvider.of<ProductsCubit>(context);
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

                    
                    //bu metod ne qeder yoxlasam da işlemedi 


                    
                    test(index);
                    print("test");
                    print("asdaasd");
                    cubit.deleteProduct(index);
                    productList.removeAt(index);

                  },
                );
              });
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void test(index) {
    log("sssssssssssssss");
  }
}

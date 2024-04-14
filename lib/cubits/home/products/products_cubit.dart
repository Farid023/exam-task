import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';
import '../../../data/services/fake_store_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

   List<Product> _productsList = [];
 // int? deletedProductIndex;

  void getProducts() async {
    try {
      emit(ProductsLoading());
      final result = await FakeStoreService.getProducts();
      _productsList = result;
      emit(ProductsSuccess(data: _productsList));
    } catch (e) {
      emit(ProductsFailure(
          errorMessage: "Error occurred. Please try again later."));
    }
  }

  void deleteProduct(int index) {
    _productsList.removeAt(index);
    print(_productsList[index]);

    emit(ProductsSuccess(data: _productsList));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';
import '../../../data/services/fake_store_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

   List<Product> _productsList = [];

  void getProducts() async {
    try {
      emit(ProductsLoading());
      _productsList = await FakeStoreService.getProducts();
      emit(ProductsSuccess(data: _productsList));
    } catch (e) {
      emit(ProductsFailure(
          errorMessage: "Error occurred. Please try again later."));
    }
  }

  void deleteProduct(int? id) {
    _productsList.removeWhere((product) => product.id == id);
    emit(ProductsSuccess(data: _productsList));
  }
}

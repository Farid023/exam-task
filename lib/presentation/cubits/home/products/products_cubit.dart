import 'package:e_commerce_task/domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/product_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productRepository) : super(ProductsInitial());
  final ProductRepository _productRepository;

  List<Product> _productsList = [];
  final List<Product> deletedProducts = [];

  void getProducts() async {
    try {
      emit(ProductsLoading());
      _productsList = await _productRepository.getProducts();
      emit(ProductsSuccess(data: _productsList));
    } catch (e) {
      emit(ProductsFailure(
          errorMessage: "Error occurred. Please try again later."));
    }
  }

  void deleteProduct(int? id) {
    _productsList.removeWhere((product) {
      if (product.id == id) {
        deletedProducts.add(product);
        return true;
      }
      return false;
    });
    emit(ProductsSuccess(data: _productsList));
  }

  void undoDeletedProduct(int? id) {
    deletedProducts.removeWhere((product) {
      if (product.id == id) {
        _productsList.add(product);
        return true;
      }
      return false;
    });
    emit(ProductsSuccess(data: _productsList));
  }

  void removeAllFromTrash() {
    if (deletedProducts.isNotEmpty) {
      _productsList.addAll(deletedProducts);
      deletedProducts.clear();
      emit(ProductsSuccess(data: _productsList));
    }
  }
}

part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<Product> data;

  ProductsSuccess({required this.data});
}

final class ProductsFailure extends ProductsState {
  final String errorMessage;

  ProductsFailure({required this.errorMessage});
}

final class ProductsDelete extends ProductsState {
  final Product product;

  ProductsDelete({required this.product});

}



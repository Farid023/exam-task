import 'package:dio/dio.dart';
import 'package:e_commerce_task/data/repositories/products_repository_impl.dart';
import 'package:e_commerce_task/domain/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Dio());

  locator.registerLazySingleton<ProductRepository>(
      () => ProductsRepositoryImpl(dio: locator()));
}

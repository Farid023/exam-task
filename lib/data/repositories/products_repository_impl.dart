import 'package:dio/dio.dart';


import '../../domain/repositories/product_repository.dart';
import '../endpoints.dart';
import '../models/product_model.dart';

class ProductsRepositoryImpl implements ProductRepository {
  ProductsRepositoryImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await dio.get(Endpoints.products);
      print(response);
      if (response.statusCode == 200) {
        List<dynamic> json = response.data;
        List<Product> products =
            json.map((product) => Product.fromJson(product)).toList();
        return products;
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

// static Future<List<Product>> getProducts() async {
//   try {
//     final response = await dio.get(Endpoints.products);
//     print(response);
//     if (response.statusCode == 200) {
//       List<dynamic> json = response.data;
//       List<Product> products =
//           json.map((product) => Product.fromJson(product)).toList();
//       return products;
//     } else {
//       throw Exception('Failed to load categories: ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception(e);
//   }
// }
}

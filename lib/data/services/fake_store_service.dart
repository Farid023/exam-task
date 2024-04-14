import 'package:dio/dio.dart';

import '../endpoints.dart';
import '../models/product_model.dart';

class FakeStoreService {
  FakeStoreService._();

  static Dio dio = Dio();

  static Future<List<Product>> getProducts() async {
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
}

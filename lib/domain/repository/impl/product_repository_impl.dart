import 'dart:developer';

import 'package:lets_shop/core/config/http/app_dio_client.dart';
import 'package:lets_shop/core/utils/endpoint_urls.dart';
import 'package:lets_shop/domain/model/product_model.dart';
import 'package:lets_shop/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<List<Product>?> getAllProducts() async {
    try {
      final response =
          (await DioClient.dioClient.dioEdge.get(EndpointUrls.getProducts))
              .data["data"];
      return List<Product>.generate(
        response.length,
        (index) => Product.fromMap(response[index]),
      );
    } catch (e, stack) {
      log("Error ", error: e, stackTrace: stack);
      return null;
    }
  }
}

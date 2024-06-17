import 'package:lets_shop/domain/model/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>?> getAllProducts();
}

import 'package:state_management_example/shared/models/product.dart';
import 'package:state_management_example/shared/utils/app_variables.dart';

class ProductRange {
  ProductRange({this.products});

  final List<Product> products;

  List<Product> getFromCategory(Category category) {
    final List<Product> specificProducts = products.where((product) => product.category == category).toList();
    return specificProducts;
  }
}

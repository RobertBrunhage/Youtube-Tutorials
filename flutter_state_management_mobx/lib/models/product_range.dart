import 'package:state_management_example/global/app_variables.dart';
import 'package:state_management_example/models/product.dart';

class ProductRange {
  ProductRange({this.products});

  final List<Product> products;

  List<Product> getFromCategory(Category category) {
    final List<Product> specificProducts =
        products.where((product) => product.category == category).toList();
    return specificProducts;
  }
}

import 'package:flutter/widgets.dart';
import 'package:state_management_example/global/app_variables.dart';

class Product {
  Product(
      {@required this.name,
      @required this.description,
      @required this.category,
      @required this.price,
      @required this.imageURL});
  final String name;
  final String description;
  final Category category;
  final double price;
  final String imageURL;
}

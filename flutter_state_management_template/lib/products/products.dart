import 'package:flutter/material.dart';
import 'package:state_management_example/products/widgets.dart/product_card.dart';
import 'package:state_management_example/shared/models/product.dart';
import 'package:state_management_example/shared/models/product_range.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';
import 'package:state_management_example/shared/utils/app_variables.dart';
import 'package:state_management_example/shared/widgets/cart_app_bar.dart';

class ProductPage extends StatefulWidget {
  ProductPage({this.category});
  final Category category;
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductRange productRange = ProductRange(products: [
    Product(
        name: 'Bluebarries',
        description: 'Delicious blueberries from the wild.',
        category: Category.Food,
        price: 30.0,
        imageURL: 'assets/pictures/Blueberries.jpg'),
    Product(
        name: 'Mario Game',
        description: 'Play as the famous plummer in the real world.',
        category: Category.Games,
        price: 70.0,
        imageURL: 'assets/pictures/Mario.jpg'),
    Product(
      name: 'Dart',
      description: 'Simple dart game.',
      category: Category.Games,
      price: 20.0,
      imageURL: 'assets/pictures/Dart.jpg',
    ),
    Product(
        name: 'Watermelon',
        description: 'Water and suger in a red solid form.',
        category: Category.Food,
        price: 40.0,
        imageURL: 'assets/pictures/Watermelon.jpg'),
    Product(
        name: 'Candy Crush',
        description: 'Don\'t you have a phone?',
        category: Category.Games,
        price: 5.0,
        imageURL: 'assets/pictures/Candy_Crush.jpg')
  ]);

  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;
    final productRangeCategory = productRange.getFromCategory(widget.category);
    return Scaffold(
      body: Container(
        color: AppColors.appGray1,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 56 + statusbar),
              child: GridView.count(
                childAspectRatio: (1 / 1.26),
                padding: EdgeInsets.only(top: 10),
                crossAxisCount: 2,
                children: List.generate(productRangeCategory.length, (index) {
                  final product = productRangeCategory[index];
                  return ProductCard(product: product);
                }),
              ),
            ),
            CartAppBar(
              inHomePage: false,
              title: AppVariables.getCategoryString(widget.category),
            ),
          ],
        ),
      ),
    );
  }
}

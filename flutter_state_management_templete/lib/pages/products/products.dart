import 'package:flutter/material.dart';
import 'package:state_management_example/global/styles/app_colors.dart';
import 'package:state_management_example/global/app_variables.dart';
import 'package:state_management_example/global/widgets/cart_app_bar.dart';
import 'package:state_management_example/models/product.dart';
import 'package:state_management_example/pages/products/widgets.dart/product_card.dart';

class ProductPage extends StatefulWidget {
  ProductPage({this.category});
  final Category category;
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Product product = Product(
      name: 'Bluebarries',
      description: 'Delicious blueberries from the wild.',
      category: Category.Food,
      price: 55.0,
      imageURL: 'assets/pictures/Bluebarries.png');
  Product product2 = Product(
      name: 'barries game',
      description: 'Delicious blueberries from the wild.',
      category: Category.Games,
      price: 95.0,
      imageURL: 'assets/pictures/Bluebarries.png');
  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;
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
                children: <Widget>[
                  ProductCard(
                    product: product,
                  ),
                  ProductCard(
                    product: product2,
                  ),
                ],
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

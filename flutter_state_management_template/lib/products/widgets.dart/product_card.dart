import 'package:flutter/material.dart';
import 'package:state_management_example/shared/models/product.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';
import 'package:state_management_example/shared/styles/app_fonts.dart';

class ProductCard extends StatelessWidget {
  ProductCard({@required this.product});

  final Product product;

  void _addToCartOnClick(BuildContext context) {
    //TODO: 3. Add provider and make an add to cart function
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Container(
            height: 132,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(product.imageURL),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(3),
                topLeft: Radius.circular(3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text(
                    product.name,
                    style: AppFonts.productCardTitle(),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  child: Text(product.description,
                      style: AppFonts.productCardTDescription()),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('\$' + product.price.toString(),
                    style: AppFonts.productCardPrice()),
                RaisedButton(
                  onPressed: () => _addToCartOnClick(context),
                  color: AppColors.appBlue1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: <Widget>[
                      //Icon(Icons.add_shopping_cart, color: AppColors.appWhite),
                      Text('Add to cart', style: AppFonts.productCardBtn())
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

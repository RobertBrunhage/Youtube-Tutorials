import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management_example/cart/cart.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';
import 'package:state_management_example/shared/styles/app_fonts.dart';
import 'package:state_management_example/shared/widgets/cart_list_tile.dart';

import 'cart_icon_button.dart';

class CartAppBar extends StatefulWidget {
  CartAppBar({@required this.inHomePage, @required this.title});

  final bool inHomePage;
  final String title;

  @override
  _CartAppBarState createState() => _CartAppBarState();
}

class _CartAppBarState extends State<CartAppBar> {
  bool showCart = false;

  void _cartOnClick() {
    setState(() {
      showCart = !showCart;
    });
  }

  void _deleteOnClick() {
    final cart = Provider.of<Cart>(context);
    cart.emptyCart();
  }

  void _categoryOnClick(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _checkoutOnClick() {
    print('Go to checkout here!');
  }

  Widget buildButton() {
    Widget homeBtn = IconButton(
      icon: Icon(Icons.arrow_back, color: AppColors.appWhite),
      onPressed: () => _categoryOnClick(context),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15.0),
    );
    Widget deleteBtn = IconButton(
      icon: Icon(Icons.delete_outline, color: AppColors.appWhite),
      onPressed: () => _deleteOnClick(),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15.0),
    );

    if (widget.inHomePage) {
      return AnimatedCrossFade(
        firstChild: deleteBtn,
        secondChild: const SizedBox(width: 48),
        crossFadeState: showCart ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 250),
      );
    } else {
      return AnimatedCrossFade(
        firstChild: deleteBtn,
        secondChild: homeBtn,
        crossFadeState: showCart ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 250),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = 56;
    double dragStart;
    final cart = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onVerticalDragStart: (d) {
        dragStart = d.globalPosition.dy;
      },
      onVerticalDragUpdate: (d) {
        if (dragStart != null) {
          if (d.globalPosition.dy > dragStart + 100) {
            setState(() => showCart = true);
          } else if ((d.globalPosition.dy < dragStart - 100)) {
            setState(() => showCart = false);
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        height: showCart == true ? screenHeight * 0.85 : 56 + statusbar,
        decoration: BoxDecoration(
          color: AppColors.appBlue1,
          boxShadow: [
            BoxShadow(
              color: AppColors.appBlack,
              blurRadius: 10,
              spreadRadius: 10,
              offset: Offset(0, -10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: appBarHeight + statusbar,
              child: Padding(
                padding: EdgeInsets.only(top: statusbar),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildButton(),
                    Expanded(
                      child: Text(
                        showCart ? 'Cart' : widget.title,
                        textAlign: TextAlign.center,
                        style: AppFonts.appbarTitle(),
                      ),
                    ),
                    CartIconButton(
                      cartOnClick: _cartOnClick,
                    ),
                  ],
                ),
              ),
            ),
            if (showCart == true)
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: List.generate(cart.uniqueProducts.length, (index) {
                          final product = cart.uniqueProducts[index];
                          return Observer(
                            builder: (_) {
                              final quantity = cart.getProductQuantity(product);
                              if (quantity > 0) {
                                return CartListTile(
                                  product: product,
                                  quantity: cart.getProductQuantity(product),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Observer(builder: (_) {
                                return Row(
                                  children: <Widget>[
                                    Text(
                                      "\$${cart.cartValue}",
                                      style: AppFonts.cartValue(),
                                    ),
                                    if (cart.freight != 0)
                                      Text(
                                        " + \$${cart.freight}",
                                        style: AppFonts.cartValue(),
                                      ),
                                  ],
                                );
                              }),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: AppColors.appWhite,
                                splashColor: Colors.grey,
                                onPressed: () => _checkoutOnClick(),
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.payment,
                                        color: AppColors.appBlue2,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Go to checkout',
                                        style: AppFonts.cartCheckOutBtn(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management_example/cart/cart.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';
import 'package:state_management_example/shared/styles/app_fonts.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    Key key,
    @required this.cartOnClick,
  }) : super(key: key);
  final Function cartOnClick;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return IconButton(
      icon: Container(
        height: 50,
        width: 50,
        child: Stack(
          children: <Widget>[
            Center(
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.appWhite,
              ),
            ),
            Container(
              width: 15,
              height: 15,
              margin: EdgeInsets.fromLTRB(18, 6, 0, 0),
              decoration: BoxDecoration(
                color: AppColors.appRed,
                shape: BoxShape.circle,
              ),
              child: Observer(
                builder: (_) => Center(
                  child: Text(
                    '${cart.cartContent.length}',
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.cartQuantityNumber(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () => cartOnClick(),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 15.0),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:state_management_example/shared/models/product.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';
import 'package:state_management_example/shared/styles/app_fonts.dart';
import 'package:state_management_example/shared/utils/app_dialogs.dart';

class CartListTile extends StatefulWidget {
  CartListTile({
    @required this.product,
    @required this.quantity,
  });

  final Product product;
  final int quantity;

  @override
  _CartListTileState createState() => _CartListTileState();
}

class _CartListTileState extends State<CartListTile> {
  int quantity;
  //TODO: 11. Declare cart variable

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //TODO: 12. Set cart from provider
  }

  @override
  void initState() {
    quantity = widget.quantity;
    super.initState();
  }

  Future<void> tileOnClick() async {
    quantity = await AppDialog.quantityDialog(
      context: context,
      title: 'Quantity',
      quantity: widget.quantity,
    );
    //TODO: 14. Make a function to change product quantity in cart
  }

  void tileOnSwipe(Product product) {
    //TODO: 13. Make a function to remove product from cart
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        tileOnSwipe(widget.product);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        color: AppColors.appWhite,
        child: ListTile(
          title: Text(
            widget.product.name,
            style: AppFonts.cartTileTitle(),
          ),
          subtitle: Text(
            'Quantity: ${widget.quantity}',
            style: AppFonts.cartTileSubTitle(),
          ),
          trailing: Container(
              child: Text(
            '\$${widget.product.price * widget.quantity}',
            style: AppFonts.cartTileValue(),
          )),
          onTap: () async => tileOnClick(),
        ),
      ),
    );
  }
}

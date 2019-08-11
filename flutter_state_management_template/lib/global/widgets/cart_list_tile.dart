import 'package:flutter/material.dart';
import 'package:state_management_example/global/functions/app_dialogs.dart';
import 'package:state_management_example/global/styles/app_colors.dart';
import 'package:state_management_example/global/styles/app_fonts.dart';
import 'package:state_management_example/models/product.dart';

class CartListTile extends StatefulWidget {
  CartListTile({@required this.product, @required this.quantity});
  final Product product;
  final int quantity;

  @override
  _CartListTileState createState() => _CartListTileState();
}

class _CartListTileState extends State<CartListTile> {
  int quantity;
  @override
  void initState() {
    quantity = widget.quantity;
    super.initState();
  }

  Future<void> tileOnClick() async {
    quantity = await AppDialog.quantityDialog(
        context: context, title: 'Quantity', quantity: widget.quantity);
  }

  void tileOnSwipe(Product product) {
    print('On swipe here!');
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        tileOnSwipe(widget.product);
      },
      child: Container(
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

import 'package:flutter/material.dart';
import 'package:state_management_example/global/styles/app_colors.dart';
import 'package:state_management_example/global/styles/app_fonts.dart';

class AppDialog {
  static String addOnClick({TextEditingController textEditingController}) {
    print('Add quantity here!');
    double currentValue = double.parse(textEditingController.text);
    if (currentValue < 999) {
      currentValue++;
    }
    return currentValue.toString();
  }

  static String subtrackOnClick({TextEditingController textEditingController}) {
    print('Subtract quantity here!');
    double currentValue = double.parse(textEditingController.text);
    if (currentValue > 0) {
      currentValue--;
    }
    return textEditingController.text = currentValue.toString();
  }

  static String onTextFieldChange({String quantity}) {
    print('On change text field here!');
    return quantity;
  }

  static void cancelOnClick({BuildContext context}) {
    print('Cancel change here!');
    Navigator.of(context).pop();
  }

  static void confirmOnClick({BuildContext context}) {
    print('Confirm quantity here!');
    Navigator.of(context).pop();
  }

  static Future<double> quantityDialog(
      {@required BuildContext context,
      @required String title,
      @required double quantity}) async {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = quantity.toString();
    final newQuantity = await showDialog<double>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: AppFonts.dialogTitle(),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.appBlue1,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        color: AppColors.appWhite,
                        icon: Icon(Icons.exposure_neg_1),
                        onPressed: () => textEditingController.text =
                            AppDialog.subtrackOnClick(
                                textEditingController: textEditingController),
                      ),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: AppColors.appGray2,
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        textAlign: TextAlign.center,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        onChanged: (onChangeQuantity) =>
                            textEditingController.text =
                                onTextFieldChange(quantity: onChangeQuantity),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.appBlue1,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        color: AppColors.appWhite,
                        icon: Icon(Icons.exposure_plus_1),
                        onPressed: () => textEditingController.text =
                            AppDialog.addOnClick(
                                textEditingController: textEditingController),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () =>
                          AppDialog.cancelOnClick(context: context),
                      child: Text('Cancel'),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: AppColors.appBlue1,
                      splashColor: Colors.grey,
                      onPressed: () =>
                          AppDialog.confirmOnClick(context: context),
                      child: Container(
                          child: Text(
                        'Confirm',
                        style: AppFonts.categoryCardBtn(),
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
    return (newQuantity != null) ? newQuantity : quantity;
  }
}

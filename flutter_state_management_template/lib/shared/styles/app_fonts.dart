import 'package:flutter/material.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';

class AppFonts {
  static final regularFont = FontWeight.w400;
  static final semiBoldFont = FontWeight.w500;
  static final boldFont = FontWeight.w600;

  static appbarTitle() => TextStyle(color: AppColors.appWhite, fontSize: 24, fontWeight: boldFont);
  static cartValue() => TextStyle(color: AppColors.appWhite, fontSize: 18, fontWeight: semiBoldFont);
  static cartCheckOutBtn() => TextStyle(color: AppColors.appBlue2, fontSize: 18, fontWeight: boldFont);

  static cartTileValue() => TextStyle(color: AppColors.appBlack, fontSize: 18, fontWeight: semiBoldFont);

  static cartTileTitle() => TextStyle(color: AppColors.appBlack, fontSize: 18, fontWeight: boldFont);

  static cartTileSubTitle() => TextStyle(color: AppColors.appGray4, fontSize: 14, fontWeight: regularFont);

  static categoryCardTitle() => TextStyle(color: AppColors.appBlack, fontSize: 24, fontWeight: boldFont);
  static categoryCardTtext() => TextStyle(color: AppColors.appGray4, fontSize: 14, fontWeight: semiBoldFont);
  static categoryCardBtn() => TextStyle(color: AppColors.appWhite, fontSize: 16, fontWeight: semiBoldFont);

  static productCardTitle() => TextStyle(color: AppColors.appBlack, fontSize: 24, fontWeight: boldFont);
  static productCardTDescription() => TextStyle(color: AppColors.appGray4, fontSize: 12, fontWeight: semiBoldFont);
  static productCardPrice() => TextStyle(color: AppColors.appBlue2, fontSize: 16, fontWeight: semiBoldFont);
  static productCardBtn() => TextStyle(color: AppColors.appWhite, fontSize: 16, fontWeight: semiBoldFont);

  static dialogTitle() => TextStyle(color: AppColors.appBlack, fontSize: 24, fontWeight: boldFont);
  static dialogQuantity() => TextStyle(color: AppColors.appWhite, fontSize: 16, fontWeight: semiBoldFont);
  static dialogCancelBtn() => TextStyle(color: AppColors.appWhite, fontSize: 16, fontWeight: semiBoldFont);
  static dialogConfirmBtn() => TextStyle(color: AppColors.appWhite, fontSize: 16, fontWeight: semiBoldFont);

  static cartQuantityNumber() => TextStyle(color: AppColors.appWhite, fontSize: 10, fontWeight: semiBoldFont);
}

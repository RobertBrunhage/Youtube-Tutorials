import 'package:flutter/material.dart';
import 'package:state_management_example/home/widgets/category_card.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';
import 'package:state_management_example/shared/utils/app_variables.dart';
import 'package:state_management_example/shared/widgets/cart_app_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                children: <Widget>[
                  CategoryCard(
                      title: 'Games',
                      text: 'Diverse library of games for all platforms.',
                      color: AppColors.appBlue1,
                      iconData: Icons.gamepad,
                      category: Category.Games),
                  CategoryCard(
                      title: 'Food',
                      text: 'We have food for any occasion.',
                      color: AppColors.appGreen,
                      iconData: Icons.fastfood,
                      category: Category.Food),
                ],
              ),
            ),
            CartAppBar(
              title: 'State Management',
              inHomePage: true,
            ),
          ],
        ),
      ),
    );
  }
}

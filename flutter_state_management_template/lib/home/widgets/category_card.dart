import 'package:flutter/material.dart';
import 'package:state_management_example/products/products.dart';
import 'package:state_management_example/shared/styles/app_colors.dart';
import 'package:state_management_example/shared/styles/app_fonts.dart';
import 'package:state_management_example/shared/utils/app_variables.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    this.title,
    this.text,
    this.color,
    this.iconData,
    this.category,
  });

  final String title;
  final String text;
  final Color color;
  final IconData iconData;
  final Category category;

  void navigateToProducts({BuildContext context, Category category}) {
    Navigator.of(context).push<ProductPage>(
      MaterialPageRoute(
        builder: (BuildContext context) => ProductPage(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: double.infinity,
        height: 180,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: AppFonts.categoryCardTitle(),
                        ),
                        const SizedBox(height: 5),
                        Text(text, style: AppFonts.categoryCardTtext()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 165,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color: color,
                        onPressed: () => navigateToProducts(context: context, category: category),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.apps,
                              color: AppColors.appWhite,
                            ),
                            Text('Browse $title', style: AppFonts.categoryCardBtn()),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    bottomRight: Radius.circular(3),
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                ),
                child: Icon(
                  iconData,
                  size: 75,
                  color: AppColors.appWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

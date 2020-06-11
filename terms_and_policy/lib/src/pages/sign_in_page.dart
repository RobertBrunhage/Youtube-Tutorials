import 'package:flutter/material.dart';
import 'package:terms_and_policy/src/shared/authentication/or_divider.dart';
import 'package:terms_and_policy/src/shared/authentication/terms_of_use.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: kToolbarHeight * 2),
                    Text(
                      "Sign up",
                      style: textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Sign up fields here",
                    style: textTheme.headline6,
                  ),
                  smallHeightSpacing,
                  OrDivider(),
                  smallHeightSpacing,
                  InkWell(
                    onTap: () {}, // push to sign up
                    child: Text(
                      "Sign in",
                      style: textTheme.headline6,
                    ),
                  ),
                  SizedBox(height: 74),
                  TermsOfUse(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get smallHeightSpacing => SizedBox(height: 12);
}

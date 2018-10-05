import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {

  Container buildTitle(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      alignment: Alignment.bottomCenter,
      height: 60.0,
      child: Text('Welcome!', style: TextStyle(fontSize: 18.0, color: theme.primaryColorDark),),
    );
  }

  SizedBox buildFacebookBtn() {
    return SizedBox(
      width: 250.0,
      child: FlatButton(
        onPressed: () {},
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: Color(0xFF486198),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(MdiIcons.facebook, size: 16.0,),
            SizedBox(width: 8.0,),
            Text('Sign up with Facebook')
          ],
        ),
      ),
    );
  }

  Padding buildText(String text, double fontSize ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(color: theme.primaryColorDark, fontSize: fontSize,),),
    );
  }

  Padding buildInputField(String labelText, String hintText, bool isObscured, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: theme.primaryColorDark),
        ),
        obscureText: isObscured,
      ),
    );
  }

  SizedBox buildSignUpBtn(ThemeData theme) {
    return SizedBox(
      width: 250.0,
      child: RaisedButton(
        onPressed: () {},
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        color: theme.buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Text('Sign up with email'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return new Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, kToolbarHeight, 16.0, 16.0),
        children: <Widget>[
          Align(
            child: SizedBox(
              width: 320.0,
              child: Card(
                color: theme.primaryColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    buildTitle(theme),
                    buildFacebookBtn(),
                    buildText('or', 12.0, theme),
                    buildText('Sign up with your email address', 12.0, theme),
                    buildInputField('Email', 'Your@email.com', false, theme),
                    buildInputField('Password', '', true, theme),
                    SizedBox(height: 18.0,),
                    buildSignUpBtn(theme),
                    buildText('By signing up you agree with our Terms & Conditions.', 8.0, theme),
                    SizedBox(height: 18.0,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscured = true;
  Color _eyeButtonColor = Colors.grey;

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Login', style: TextStyle(fontSize: 42.0),),
    );
  }

  Padding buildTitleLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 38.0,
          height: 1.5,
          color: Colors.black,
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      onSaved: (emailInput) => _email = emailInput,
      validator: (emailInput) {
        if (emailInput.isEmpty) {
          return 'Please enter an email';
        }
      },
      decoration: InputDecoration(
        labelText: 'Email Address'
      ),
    );
  }

  TextFormField buildPasswordInput(BuildContext context) {
    return TextFormField(
      onSaved: (passwordInput) => _password = passwordInput,
      validator: (passwordInput) {
        if (passwordInput.isEmpty) {
          return 'Please enter a password';
        }
      },
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          onPressed: () {
            if (_isObscured) {
              setState(() {
                _isObscured = false;
                _eyeButtonColor = Theme
                  .of(context)
                  .primaryColor;
              });
            } else {
              setState(() {
                _isObscured = true;
                _eyeButtonColor = Colors.grey;
              });
            }
          },
          icon: Icon(Icons.remove_red_eye, color: _eyeButtonColor,),
        ),
      ),
      obscureText: _isObscured,
    );
  }

  Padding buildPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text('Forgot Password?', style: TextStyle(fontSize: 12.0, color: Colors.grey),),
      ),
    );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 50.0,
        width: 270.0,
        child: FlatButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              //Only gets here if the fields pass
              _formKey.currentState.save();
              //TODO Check values and navigate to new page
            }
          },
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Text('LOGIN', style: Theme
            .of(context)
            .primaryTextTheme
            .button,),
        ),
      ),
    );
  }

  Align buildOrText() {
    return Align(
      alignment: Alignment.center,
      child: Text('or login with', style: TextStyle(fontSize: 12.0, color: Colors.grey),),
    );
  }

  Container buildSocialMediaButtons(IconData icon, Color iconColor) {
    return Container(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(30.0),
        child: Icon(icon, color: iconColor),
      ),
      height: 46.0,
      width: 46.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 0.5)
      ),
    );
  }

  Align buildSignUpText() {
    return Align(
      child: RichText(
        text: TextSpan(
          text: 'You Don\'t have an account?',
          style: TextStyle(fontSize: 12.0, color: Colors.grey),
          children: <TextSpan>[
            TextSpan(
              text: ' SIGN UP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black)
            ),
          ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 22.0),
          children: <Widget>[
            SizedBox(height: kToolbarHeight),
            buildTitle(),
            buildTitleLine(),
            SizedBox(height: 70.0,),
            buildEmailTextField(),
            SizedBox(height: 30.0,),
            buildPasswordInput(context),
            buildPasswordText(),
            SizedBox(height: 60.0,),
            buildLoginButton(context),
            SizedBox(height: 30.0,),
            buildOrText(),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildSocialMediaButtons(GroovinMaterialIcons.google, Colors.blue),
                SizedBox(width: 16.0,),
                buildSocialMediaButtons(GroovinMaterialIcons.facebook, Colors.blue.shade800),
                SizedBox(width: 16.0,),
                buildSocialMediaButtons(GroovinMaterialIcons.twitter, Colors.lightBlue),
              ],
            ),
            SizedBox(height: 70.0),
            buildSignUpText()
          ],
        ),
      ),
    );
  }
}
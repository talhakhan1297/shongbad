import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shongbad/elements/button.dart';
import 'package:shongbad/style/theme.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  Widget _usernameField() {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      onSaved: (value) => _username = value,
      validator: (value) =>
          value.length == 0 ? 'Please enter your username' : null,
      keyboardType: TextInputType.text,
      style: _textTheme.headline4,
      decoration: InputDecoration(
        labelText: "Username",
        labelStyle: _textTheme.subtitle2.copyWith(
          color: _theme.primaryColor.withOpacity(0.75),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: _theme.primaryColor.withOpacity(0.5))),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: _theme.primaryColor.withOpacity(0.5))),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: _theme.primaryColor.withOpacity(0.5))),
      ),
    );
  }

  Widget _passwordField() {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      onSaved: (value) => _password = value,
      validator: (value) =>
          value.length == 0 ? 'Please enter your password' : null,
      obscureText: true,
      style: _textTheme.headline4,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: _textTheme.subtitle2.copyWith(
          color: _theme.primaryColor.withOpacity(0.75),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: _theme.primaryColor.withOpacity(0.5))),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: _theme.primaryColor.withOpacity(0.5))),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: _theme.primaryColor.withOpacity(0.5))),
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      // print('Email: $_email, Password: $_password');
      Navigator.pushReplacementNamed(context, '/kPageView');
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return Dismissible(
      key: ValueKey("dismissKey"),
      direction: DismissDirection.up,
      onDismissed: (direction) {
        if (direction == DismissDirection.up) {
          Navigator.of(context).pushReplacementNamed('/kPageView');
        }
      },
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: _theme.backgroundColor,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  height: deviceHeight(context) - 24,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(height: deviceHeight(context) * 0.15),
                        Image.asset(
                          "assets/images/logoLight.png",
                          width: deviceWidth(context) * 0.7,
                        ),
                        SizedBox(height: deviceHeight(context) * 0.05),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: deviceWidth(context) * 0.8,
                              child: _usernameField(),
                            ),
                            SizedBox(height: deviceHeight(context) * 0.025),
                            Container(
                              width: deviceWidth(context) * 0.8,
                              child: _passwordField(),
                            ),
                            SizedBox(height: deviceHeight(context) * 0.025),
                            Container(
                              width: deviceWidth(context) * 0.8,
                              height: 42,
                              child: Button(
                                  text: Text(
                                    "Signin",
                                    style: _textTheme.headline3.copyWith(
                                        color: _theme.backgroundColor),
                                  ),
                                  color: _theme.primaryColor,
                                  onPressed: () {
                                    _submit();
                                  }),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/signUp');
                              },
                              child: Text(
                                "Signup?",
                                style: _textTheme.bodyText1
                                    .copyWith(color: _theme.primaryColor),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: deviceWidth(context) * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/facebook.svg",
                                      color: _theme.primaryColor,
                                      width: 20,
                                      height: 20,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/google.svg",
                                      color: _theme.primaryColor,
                                      width: 20,
                                      height: 20,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/twitter.svg",
                                      color: _theme.primaryColor,
                                      width: 20,
                                      height: 20,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_up,
                              size: 24,
                              color: _theme.primaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                "Swipe up to skip",
                                style: _textTheme.bodyText1
                                    .copyWith(color: _theme.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

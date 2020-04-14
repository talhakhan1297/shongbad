import 'package:flutter/material.dart';
import 'package:shongbad/elements/button.dart';
import 'package:shongbad/style/theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _username = '';
  String _password = '';

  Widget _labelText(String label) {
    return Padding(
      padding: EdgeInsets.only(
          top: deviceHeight(context) * 0.0075,
          bottom: deviceHeight(context) * 0.00075),
      child: Text(label, style: Theme.of(context).textTheme.headline2),
    );
  }

  Widget _nameField() {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      onSaved: (value) => _name = value,
      validator: (value) => value.length == 0 ? 'Please enter your name' : null,
      keyboardType: TextInputType.text,
      style: _textTheme.headline4,
      decoration: InputDecoration(
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

  Widget _emailField() {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      onSaved: (value) => _email = value,
      validator: (value) => !value.contains('@') ? "Invalid email" : null,
      keyboardType: TextInputType.emailAddress,
      style: _textTheme.headline4,
      decoration: InputDecoration(
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
      keyboardType: TextInputType.text,
      style: _textTheme.headline4,
      decoration: InputDecoration(
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
      // MaterialPageRoute<dynamic> route =
      //     MaterialPageRoute(builder: (context) => SignIn());
      // Navigator.removeRoute(context, route);
      Navigator.pushReplacementNamed(context, "/homeScreen");
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: _theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: _theme.backgroundColor,
          elevation: 0,
          title: Text("Signup", style: _textTheme.headline1),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: deviceWidth(context) * 0.8,
                height: deviceHeight(context) - 80,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _labelText("Name"),
                    _nameField(),
                    _labelText("Email"),
                    _emailField(),
                    _labelText("Username"),
                    _usernameField(),
                    _labelText("Password"),
                    _passwordField(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: deviceHeight(context) * 0.025,
                          bottom: deviceHeight(context) * 0.025),
                      child: Container(
                        width: deviceWidth(context) * 0.8,
                        height: 42,
                        child: Button(
                            text: Text(
                              "Signup",
                              style: _textTheme.headline3
                                  .copyWith(color: _theme.backgroundColor),
                            ),
                            color: _theme.primaryColor,
                            onPressed: () {
                              _submit();
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

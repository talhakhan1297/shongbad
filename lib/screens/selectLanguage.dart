import 'package:flutter/material.dart';
import 'package:shongbad/elements/button.dart';
import 'package:shongbad/style/theme.dart';

class SelectLanguage extends StatefulWidget {
  SelectLanguage({Key key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  bool bangla = false;

  void _onPressed(bool state) {
    setState(() {
      bangla = state;
    });
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
          Navigator.of(context).pushReplacementNamed('/signIn');
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: _theme.backgroundColor,
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: deviceHeight(context) * 0.225),
                Image.asset(
                  "assets/images/language.png",
                  width: deviceWidth(context) * 0.4,
                ),
                SizedBox(height: deviceHeight(context) * 0.05),
                Text(
                  "Please select your language",
                  style:
                      _textTheme.headline4.copyWith(color: _theme.primaryColor),
                ),
                Text(
                  "আপনার ভাষা নির্বাচন",
                  style:
                      _textTheme.headline4.copyWith(color: _theme.primaryColor),
                ),
                SizedBox(height: deviceHeight(context) * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Button(
                        text: Text(
                          "English",
                          style: _textTheme.headline4.copyWith(
                              color: bangla
                                  ? _theme.primaryColor
                                  : _theme.backgroundColor),
                        ),
                        color: bangla
                            ? _theme.backgroundColor
                            : _theme.primaryColor,
                        onPressed: () {
                          _onPressed(false);
                        }),
                    SizedBox(width: 16),
                    Button(
                        text: Text(
                          "Bangla",
                          style: _textTheme.headline4.copyWith(
                              color: bangla
                                  ? _theme.backgroundColor
                                  : _theme.primaryColor),
                        ),
                        color: bangla
                            ? _theme.primaryColor
                            : _theme.backgroundColor,
                        onPressed: () {
                          _onPressed(true);
                        }),
                  ],
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.15,
                ),
                Icon(
                  Icons.keyboard_arrow_up,
                  size: 30,
                  color: _theme.primaryColor,
                ),
                Text(
                  "Swipe Up",
                  style:
                      _textTheme.bodyText1.copyWith(color: _theme.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

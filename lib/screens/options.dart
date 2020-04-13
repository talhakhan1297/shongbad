import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shongbad/elements/button.dart';
import 'package:shongbad/elements/columnBuilder.dart';
import 'package:shongbad/style/theme.dart';

class Options extends StatefulWidget {
  const Options({Key key}) : super(key: key);

  static const List<String> _iconPaths = [
    "assets/icons/language.svg",
    "assets/icons/notifications.svg",
    "assets/icons/hd.svg",
    "assets/icons/nights_stay.svg",
    "assets/icons/play_arrow.svg",
  ];

  static const List<String> _labels = [
    "Language",
    "Notifications",
    "HD Images",
    "Nights Mode",
    "Autoplay",
  ];
  static const List<String> _secondListLabels = [
    "Share this App",
    "Rate this App",
    "Feedback",
    "Terms and Conditions",
    "Privacy",
  ];

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  bool isSwitched = false;
  int dropdownValue = 1;
  List<bool> _switches = [
    false,
    false,
    false,
    false,
    false,
  ];

  Widget _listTile(String iconPath, String label, Widget trailing, int index) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth(context) * 0.025,
          vertical: deviceHeight(context) * 0.01),
      child: ListTile(
        onTap: () {
          setState(() {
            _switches[index] = !_switches[index];
          });
        },
        leading: SvgPicture.asset(
          iconPath,
          color: _theme.highlightColor.withOpacity(0.5),
        ),
        title: Text(
          label,
          style: _textTheme.headline3.copyWith(
            color: _theme.highlightColor.withOpacity(0.5),
          ),
        ),
        trailing: trailing,
      ),
    );
  }

  Widget _divider() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: deviceWidth(context) * 0.775,
        height: 1,
        color: Theme.of(context).highlightColor.withOpacity(0.3),
      ),
    );
  }

  Widget _secondList(String label) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return FlatButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth(context) * 0.05,
            vertical: deviceHeight(context) * 0.025),
        child: Container(
          width: deviceWidth(context),
          child: Text(
            label,
            style: _textTheme.headline3.copyWith(
              color: _theme.highlightColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: _theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: _theme.backgroundColor,
          elevation: 0,
          title: Text("Options", style: _textTheme.headline1),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: _theme.highlightColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: deviceWidth(context),
              color: _theme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Save your Preferences",
                        style: _textTheme.headline1
                            .copyWith(color: _theme.backgroundColor)),
                    Text("Sign in to save your Likes and Bookmarks",
                        style: _textTheme.bodyText1),
                    Button(
                        text: Text("Signin", style: _textTheme.headline2),
                        color: _theme.backgroundColor,
                        onPressed: () {
                          Navigator.pushNamed(context, '/signIn');
                        })
                  ],
                ),
              ),
            ),
            ColumnBuilder(
              itemCount: Options._labels.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    _listTile(
                      Options._iconPaths[index],
                      Options._labels[index],
                      index != 0
                          ? Switch(
                              value: _switches[index],
                              onChanged: (value) {
                                setState(() {
                                  _switches[index] = value;
                                });
                              },
                              activeTrackColor:
                                  _theme.accentColor.withOpacity(0.25),
                              activeColor: _theme.accentColor,
                            )
                          : DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: dropdownValue,
                                items: <DropdownMenuItem>[
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text(
                                      "English",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text(
                                      "Bangla",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    dropdownValue = value;
                                  });
                                },
                              ),
                            ),
                      index,
                    ),
                    index != 4 ? _divider() : Container(),
                  ],
                );
              },
            ),
            ColumnBuilder(
              itemCount: Options._labels.length,
              itemBuilder: (BuildContext context, int index) {
                return _secondList(Options._secondListLabels[index]);
              },
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}

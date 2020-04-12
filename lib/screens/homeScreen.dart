import 'package:flutter/material.dart';
import 'package:shongbad/style/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth(context),
      height: deviceHeight(context),
      color: Colors.red,
    );
  }
}

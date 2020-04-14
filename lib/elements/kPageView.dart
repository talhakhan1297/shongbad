import 'package:flutter/material.dart';
import 'package:shongbad/screens/discover.dart';
import 'package:shongbad/screens/homeScreen.dart';
import 'package:shongbad/screens/webView.dart';

class KPageView extends StatefulWidget {
  const KPageView({Key key}) : super(key: key);

  @override
  _KPageViewState createState() => _KPageViewState();
}

class _KPageViewState extends State<KPageView> {
  final PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Discover(pageController),
        HomeScreen(pageController),
        KWebView(pageController)
      ],
    );
  }
}

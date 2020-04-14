import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shongbad/style/colors.dart';

class KWebView extends StatelessWidget {
  final PageController pageViewController;
  const KWebView(this.pageViewController, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhite,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kBlack,
            ),
            onPressed: () {
              pageViewController.animateToPage(
                1,
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
          ),
        ),
        body: WebviewScaffold(url: "https://google.com"),
      ),
    );
  }
}

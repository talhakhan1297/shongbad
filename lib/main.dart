import 'package:flutter/material.dart';
import 'package:shongbad/elements/kPageView.dart';
import 'package:shongbad/screens/options.dart';
import 'package:shongbad/screens/selectLanguage.dart';
import 'package:shongbad/screens/signIn.dart';
import 'package:shongbad/screens/signUp.dart';
import 'package:shongbad/style/theme.dart';

bool darkmode = false;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pageController = PageController(keepPage: false);
  final List<Widget> pages = [SelectLanguage(), SignIn()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: !darkmode ? buildLightTheme(context) : buildDarkTheme(context),
      initialRoute: '/',
      routes: {
        '/': (context) => SelectLanguage(),
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        // '/homeScreen': (context) => HomeScreen(),
        '/options': (context) => Options(),
        // '/discover': (context) => Discover(),
        '/kPageView': (context) => KPageView(),
      },
    );
  }
}

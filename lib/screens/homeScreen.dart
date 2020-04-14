import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shongbad/style/colors.dart';
import 'package:shongbad/style/theme.dart';

class HomeScreen extends StatefulWidget {
  final PageController pageViewController;
  const HomeScreen(this.pageViewController, {Key key}) : super(key: key);

  static const List<String> _statusLabels = [
    "shongbad.xyz",
    "09 April 2020",
    "70 views",
  ];
  static const List<IconData> _statusIcons = [
    Icons.launch,
    Icons.access_time,
    Icons.visibility,
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool guidelines = false;

  @override
  void initState() {
    super.initState();
    // _getGuidelineState();
    SharedPreferences.getInstance().then(
      (value) {
        guidelines = value.getBool("guidelines") ?? true;
        setState(() {});
      },
    );
  }

  // void _getGuidelineState() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences guidelineState = await SharedPreferences.getInstance();
  //   guidelines = guidelineState.getBool('guidelines') ?? true;
  //   print(guidelines.toString() + " get");
  // }

  void _setGuidelineState() async {
    SharedPreferences guidelineState = await SharedPreferences.getInstance();
    await guidelineState.setBool('guidelines', false);
    print(guidelines.toString() + " set");
  }

  Widget _title(BuildContext context, String text) {
    var _textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: _textTheme.headline5.copyWith(color: kWhite),
    );
  }

  Widget _status(BuildContext context, IconData icon, String text) {
    var _textTheme = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 6, 8),
          child: Icon(icon, size: 12, color: kWhite.withOpacity(0.5)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(text,
              style: _textTheme.bodyText2
                  .copyWith(color: kWhite.withOpacity(0.5))),
        ),
      ],
    );
  }

  Widget _actionButtons(BuildContext context, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: deviceHeight(context) * 0.015),
      child: GestureDetector(
        onTap: () {
          print(deviceHeight(context).toString());
        },
        child: Container(
          decoration: BoxDecoration(
              color: kBlack.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              icon,
              color: kWhite,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, String text) {
    var _textTheme = Theme.of(context).textTheme;
    return Container(
      // height: deviceHeight(context) * 0.225,
      child: Text(
        text,
        style: _textTheme.bodyText1
            .copyWith(color: kWhite, height: deviceHeight(context) * 0.0025),
        overflow: TextOverflow.ellipsis,
        maxLines: 8,
      ),
    );
  }

  Widget _newsCard(String imagePath, String title, String body) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      child: Container(
        decoration: BoxDecoration(
          color: kDarkNavyBlue,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: kBlack.withOpacity(0.5),
              blurRadius: 30,
              spreadRadius: 0,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Image.asset(
                imagePath,
                height: deviceHeight(context) * 0.325,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  _title(context, title),
                  Row(
                    children: <Widget>[
                      _status(context, HomeScreen._statusIcons[0],
                          HomeScreen._statusLabels[0]),
                      _status(context, HomeScreen._statusIcons[1],
                          HomeScreen._statusLabels[1]),
                      _status(context, HomeScreen._statusIcons[2],
                          HomeScreen._statusLabels[2]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _actionButtons(context, Icons.help_outline),
                      _actionButtons(context, Icons.share),
                      _actionButtons(context, Icons.bookmark_border),
                    ],
                  ),
                  _body(context, body)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            width: deviceWidth(context),
            height: deviceHeight(context),
            color: kWhite,
          ),
          Scaffold(
            backgroundColor: _theme.primaryColor.withOpacity(0.85),
            appBar: AppBar(
              backgroundColor: _theme.primaryColor.withOpacity(0),
              elevation: 0,
              title: Text(
                "Trending",
                style: _textTheme.headline1.copyWith(color: kWhite),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: kWhite,
                ),
                onPressed: () {
                  widget.pageViewController.animateToPage(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear);
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: kWhite,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: PageView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                _newsCard(
                    'assets/images/sample.png',
                    "OnePlus 8 Pro to feature super fast 30W wireless charging",
                    '''The first OnePlus phone to support wireless charging, the OnePlus 8 Pro's "Warp Charge 30 Wireless system" aims to charge a phone by 60% in thirty minutes. With the system operating at 30W at peak speed, the handset and charger will also be compatible with Qi charging pads. OnePlus 8 Pro also features reverse wireless charging and a 120Hz display. '''),
                _newsCard(
                    'assets/images/sample2.png',
                    "Usain Bolt shares pic from 2008 Olympics race win to illustrate social distancing",
                    '''Eight-time Olympic gold medallist Usain Bolt took to social media to share a picture of himself winning the 100 metres final at the 2008 Beijing Olympics and captioned it,"Social distancing:' Reacting to Bolt's picture, a user wrote, "You've been doin it forever" Another user wrote, "Never seen a bigger flex in my life."'''),
                _newsCard(
                    'assets/images/sample1.png',
                    "OnePlus has unveiled its new flagship phones - OnePlus 8 & 8 Pro",
                    '''OnePlus officially unveiled its OnePlus 8 and 8 Pro, delivering its flagship-tier, design, and updated camera specifications. The main highlights include a 6.78" Fluid AMOLED display on the OnePlus 8 Pro, 5G connectivity, Snapdragon 865, an official IP68 rating, and two 48MP cameras. The OnePlus 8 also has a 48MP camera, 90Hz display, 5G connectivity and Snapdragon 865.'''),
              ],
            ),
          ),
          guidelines
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      guidelines = false;
                    });
                    _setGuidelineState();
                  },
                  child: Container(
                    width: deviceWidth(context),
                    height: deviceHeight(context),
                    color: kBlack.withOpacity(0.8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(height: deviceHeight(context) * 0.2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Swipe left for full story",
                              style: _textTheme.headline5.copyWith(
                                color: kWhite.withOpacity(0.75),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_left,
                              color: kWhite.withOpacity(0.75),
                              size: 40,
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.keyboard_arrow_up,
                              color: kWhite.withOpacity(0.75),
                              size: 40,
                            ),
                            Text(
                              "Swipe up for next story",
                              style: _textTheme.headline5.copyWith(
                                color: kWhite.withOpacity(0.75),
                              ),
                            ),
                            SizedBox(height: 24)
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}

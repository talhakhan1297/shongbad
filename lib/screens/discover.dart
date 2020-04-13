import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shongbad/style/theme.dart';

class Discover extends StatelessWidget {
  const Discover({Key key}) : super(key: key);

  static const List<List<String>> _categoryItems = [
    ["My Feed", "assets/icons/myFeed.svg"],
    ["All News", "assets/icons/allNews.svg"],
    ["Top Stories", "assets/icons/topStories.svg"],
    ["Trending", "assets/icons/trending.svg"],
  ];

  static const List<List<String>> _suggestedTopics = [
    ["Business", "assets/icons/business.svg"],
    ["Politics", "assets/icons/politics.svg"],
    ["Sports", "assets/icons/sports.svg"],
    ["Technology", "assets/icons/tech.svg"],
    ["Entertainment", "assets/icons/entertainment.svg"],
    ["International", "assets/icons/international.svg"],
    ["Automobile", "assets/icons/automobile.svg"],
    ["Science", "assets/icons/science.svg"],
    ["Travel", "assets/icons/travel.svg"],
  ];

  Widget _searchField(BuildContext context) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;

    return TextField(
      style: _textTheme.headline3.copyWith(
        color: _theme.highlightColor,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(33.0),
            ),
            borderSide:
                BorderSide(color: _theme.primaryColor.withOpacity(0.5))),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(33.0),
            ),
            borderSide:
                BorderSide(color: _theme.primaryColor.withOpacity(0.5))),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(33.0),
            ),
            borderSide:
                BorderSide(color: _theme.primaryColor.withOpacity(0.5))),
        hintStyle: _textTheme.headline3.copyWith(
            color: _theme.highlightColor.withOpacity(0.5), fontSize: 16),
        hintText: "Search for news",
      ),
    );
  }

  Widget _heading(BuildContext context, String heading) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 36),
          Text(
            heading,
            style: _textTheme.headline1.copyWith(color: _theme.highlightColor),
          ),
          Container(
            height: 4,
            width: 26,
            color: _theme.accentColor,
          ),
        ],
      ),
    );
  }

  Widget _categories(BuildContext context) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categoryItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index != 3
                ? EdgeInsets.fromLTRB(0, 24, deviceWidth(context) * 0.055, 0)
                : EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  _categoryItems[index][1],
                  color: _theme.primaryColor,
                  height: 35,
                ),
                SizedBox(height: 16),
                Text(_categoryItems[index][0],
                    style: _textTheme.subtitle2
                        .copyWith(color: _theme.primaryColor)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _topics(BuildContext context) {
    var _theme = Theme.of(context);
    var _textTheme = Theme.of(context).textTheme;
    return Container(
      height: 425,
      width: deviceWidth(context),
      child: GridView.builder(
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.8),
        itemCount: _suggestedTopics.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _theme.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 0),
                        color: _theme.highlightColor.withOpacity(0.1))
                  ]),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
                      child: SvgPicture.asset(
                        _suggestedTopics[index][1],
                        color: _theme.primaryColor,
                        height: 45,
                        width: 45,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(_suggestedTopics[index][0],
                          style: _textTheme.subtitle2.copyWith(
                              color: _theme.primaryColor, fontSize: 10)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
          title: Text("Discover", style: _textTheme.headline1),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.settings,
              color: _theme.highlightColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'options');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: _theme.highlightColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 16, horizontal: deviceWidth(context) * 0.06),
              child: Column(
                children: <Widget>[
                  _searchField(context),
                  _heading(context, "CATEGORIES"),
                  _categories(context),
                  _heading(context, "SUGGESTED TOPICS"),
                  _topics(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

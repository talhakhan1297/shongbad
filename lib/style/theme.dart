import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shongbad/style/colors.dart';

ThemeData buildLightTheme(BuildContext context) {
  final ThemeData kThemeLight = ThemeData.light();
  return kThemeLight.copyWith(
    backgroundColor: kWhite,
    primaryColor: kDarkNavyBlue,
    accentColor: kYellow,
    highlightColor: kBlack,
    buttonTheme: kThemeLight.buttonTheme.copyWith(
      buttonColor: kDarkNavyBlue,
      textTheme: ButtonTextTheme.normal,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.poppins(
        fontSize: 18,
        color: kBlack,
        fontWeight: FontWeight.w600,
      ),
      headline2: GoogleFonts.poppins(
        fontSize: 14, // 16
        color: kDarkNavyBlue,
        fontWeight: FontWeight.w600,
      ),
      headline3: GoogleFonts.poppins(
        fontSize: 14, // 16
        color: kBlack,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.poppins(
        fontSize: 14, //changed from 16
        color: kBlack,
        fontWeight: FontWeight.w400,
      ),
      headline5: GoogleFonts.poppins(
        fontSize: 14,
        color: kWhite,
        fontWeight: FontWeight.w500,
      ),
      headline6: GoogleFonts.poppins(
        fontSize: 14,
        color: kDarkNavyBlue,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: GoogleFonts.poppins(
        fontSize: 14,
        color: kYellow,
        fontWeight: FontWeight.w300,
      ),
      subtitle2: GoogleFonts.poppins(
        fontSize: 12,
        color: kBlack,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: GoogleFonts.poppins(
        fontSize: 12,
        color: kWhite,
        fontWeight: FontWeight.w300,
      ),
      bodyText2: GoogleFonts.poppins(
        fontSize: 8,
        color: kWhite,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

ThemeData buildDarkTheme(BuildContext context) {
  final ThemeData kThemeDark = ThemeData.dark();
  return kThemeDark.copyWith(
    backgroundColor: kBlack,
    primaryColor: kDarkNavyBlue,
    accentColor: kYellow,
    highlightColor: kWhite,
    buttonTheme: kThemeDark.buttonTheme.copyWith(
      buttonColor: kDarkNavyBlue,
      textTheme: ButtonTextTheme.normal,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.poppins(
        fontSize: 18,
        color: kWhite,
        fontWeight: FontWeight.w600,
      ),
      headline2: GoogleFonts.poppins(
        fontSize: 16,
        color: kWhite,
        fontWeight: FontWeight.w600,
      ),
      headline3: GoogleFonts.poppins(
        fontSize: 16,
        color: kWhite,
        fontWeight: FontWeight.w500,
      ),
      headline4: GoogleFonts.poppins(
        fontSize: 16,
        color: kWhite,
        fontWeight: FontWeight.w400,
      ),
      headline5: GoogleFonts.poppins(
        fontSize: 14,
        color: kWhite,
        fontWeight: FontWeight.w500,
      ),
      headline6: GoogleFonts.poppins(
        fontSize: 14,
        color: kDarkNavyBlue,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: GoogleFonts.poppins(
        fontSize: 14,
        color: kYellow,
        fontWeight: FontWeight.w300,
      ),
      subtitle2: GoogleFonts.poppins(
        fontSize: 12,
        color: kWhite,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: GoogleFonts.poppins(
        fontSize: 12,
        color: kWhite,
        fontWeight: FontWeight.w300,
      ),
      bodyText2: GoogleFonts.poppins(
        fontSize: 8,
        color: kWhite,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

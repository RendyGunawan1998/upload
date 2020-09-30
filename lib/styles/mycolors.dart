import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors {
  static Color backgroundApp = const Color(0xFFfafafa);
  static Color toolBarApp = const Color(0xFFf8f8f8);
  static Color statusBarApp = const Color(0xFFe5e5e5);
  // static Color statusBarApp = const Color(0xFFbbbbbb);
  static Color appPrimaryColor = const Color(0xFF3b5999);
  static Color appPrimaryColor2 = const Color(0xFF223867);
  static Color appPrimaryText = const Color(0xFF5f6368);
  static Color appPrimaryText2 = const Color(0xFF767676);

  static Color test = Colors.grey;

  static Color green = const Color(0xFF45aa4a);
  static Color black = const Color(0xFF2c292a);
  static Color white = const Color(0xFFfcfcfc);
  static Color lightBlue = const Color(0xFF00C6FF);
  static Color lightYellow = const Color(0xFFf0a617);
  static Color grey = const Color(0xFFf2f2f2);
  static Color grey100 = const Color(0xFFF5F5F5);
  static Color grey200 = const Color(0xFFEEEEEE);
  static Color grey300 = const Color(0xFFE0E0E0);
  static Color grey400 = const Color(0xFFBDBDBD);
  static Color chipOrange = const Color(0x50FFD180);
  static Color appBarMenu = const Color(0xFF616161);
  static Color menuRide = const Color(0xffe99e1e);
  static Color menuCar = const Color(0xff14639e);
  static Color menuBluebird = const Color(0xff2da5d9);
  static Color menuFood = const Color(0xffec1d27);
  static Color menuSend = const Color(0xff8dc53e);
  static Color menuDeals = const Color(0xfff43f24);
  static Color menuPulsa = const Color(0xff72d2a2);
  static Color menuOther = const Color(0xffa6a6a6);
  static Color menuShop = const Color(0xff0b945e);
  static Color menuMart = const Color(0xff68a9e3);
  static Color menuTix = const Color(0xffe86f16);

  static Color tabBar = const Color(0xFF3dc1d3);

  static Color mail = const Color(0xFF34465d);
  static Color whatsapp = const Color(0xFF25D366);
  static Color fb = const Color(0xFF3b5999);
  static Color google = const Color(0xFFdd4b39);
  static Color twitter = const Color(0xFF55acee);

  static Color loginGradientStart = const Color(0XFFeeeeee);
  static Color loginGradientEnd = const Color(0xFFf5f5f5);

  static List<Color> randomColorList = const [
    Color(0xFFf19066),
    Color(0xFFf5cd79),
    Color(0xFF546de5),
    Color(0xFFe15f41),
    Color(0xFFc44569),
    Color(0xFF574b90),
    Color(0xFFf78fb3),
    Color(0xFF3dc1d3),
    Color(0xFFe66767),
    Color(0xFF303952),
    Color(0xFFf3814d),
    Color(0xFFf7d794),
    Color(0xFF778beb),
    Color(0xFFe77f67),
    Color(0xFFcf6a87),
    Color(0xFF786fa6),
    Color(0xFFf8a5c2),
    Color(0xFF63cdda),
    Color(0xFFea8685),
    Color(0xFF596275),
  ];

  // static List<Color> randomColorList = const [
  //   Color(0xFF017324),
  //   Color(0xFFd94b46),
  //   Color(0xFFba68c8),
  //   Color(0xFF4fc3f7),
  //   Color(0xFFaed581),
  //   Color(0xFFfba33a),
  //   Color(0xFF865933),
  //   Color(0xFF6c8391),
  //   Color(0xFF2bb5d1),
  //   Color(0xFF4285f4),
  //   Color(0xFFdb4437),
  //   Color(0xFF5e97f6),
  //   Color(0xFFf6bf26),
  //   Color(0xFFea6b25),
  //   Color(0xFF8dc53e),
  //   Color(0xFFe67498),
  // ];

  static Color getRandomColor(int val) {
    // print("length: " + randomColorList.length.toString());
    // print(val);
    var index = 0;
    if (val <= randomColorList.length) {
      index = val - 1;
    } else if (val > randomColorList.length) {
      index = val - randomColorList.length;
    } else if (val > randomColorList.length * 2) {
      index = val - randomColorList.length * 2;
    } else {
      index = val - randomColorList.length * 3;
    }
    // print(index);
    return randomColorList[index];
  }
}

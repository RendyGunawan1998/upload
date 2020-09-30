import 'package:baru_nih/pages/xroot/rootPage.dart';
import 'package:baru_nih/styles/mycolors.dart';
import 'package:baru_nih/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new RootPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backgroundApp,
        body: new Center(
          child: new Image.asset(
            LOGO_ORANGE,
            // height: 100.0,
            width: ScreenUtil().setHeight(400),
          ),
        ),
      ),
    );
  }
}

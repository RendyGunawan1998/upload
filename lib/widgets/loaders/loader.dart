import 'package:baru_nih/utils/all_translate.dart';
import 'package:flutter/material.dart';
import 'package:baru_nih/widgets/loaders/color_loader_3.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ColorLoader3(
              radius: 20.0,
              dotRadius: 5.0,
            ),
          ),
          Center(child: Text(allTranslations.text("wait")))
        ],
      ),
      color: Colors.white.withOpacity(0.6),
      // color: Colors.transparent,
    );
  }
}

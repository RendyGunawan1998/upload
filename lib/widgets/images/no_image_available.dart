import 'package:baru_nih/utils/all_translate.dart';
import 'package:baru_nih/utils/constants.dart';
import 'package:flutter/material.dart';

class NoImageAvailableWidget extends StatelessWidget {
  const NoImageAvailableWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 0.5)),
      height: IMAGES_HEIGHT,
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            DEFAULT_NO_IMAGE,
            width: 60.0,
            height: 60.0,
          ),
          Container(
            // margin: EdgeInsets.only(top: 8.0),
            child: Text(
              allTranslations.text("no_image_available"),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

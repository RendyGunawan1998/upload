import 'package:baru_nih/utils/constants.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const NoDataWidget({Key key, this.title, this.subTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(200),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    DEFAULT_NO_DATA,
                    fit: BoxFit.fill,
                    color: MyColors.appPrimaryColor.withAlpha(200),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                // style: textTheme.title,
                style: textTheme.display1.copyWith(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: textTheme.display1.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

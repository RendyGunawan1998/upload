import 'package:baru_nih/utils/my_import.dart';

class BodyItemCurrencyWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color valueColor;
  final EdgeInsets margin;
  final TextAlign textAlign;

  BodyItemCurrencyWidget(
      this.title, this.subTitle, this.valueColor, this.margin,
      {Key key, this.textAlign = TextAlign.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 5, // of 100%
            child: Container(
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5, // of 100%
            child: Container(
                child: Text(
              subTitle,
              textAlign: textAlign,
              style: TextStyle(color: valueColor ?? MyColors.appPrimaryText),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )),
          ),
        ],
      ),
    );
  }
}

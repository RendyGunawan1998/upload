import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  CustomCircularProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      ),
    );
  }
}

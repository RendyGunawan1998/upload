import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  CustomLinearProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearProgressIndicator(
        value: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
      ),
    );
  }
}

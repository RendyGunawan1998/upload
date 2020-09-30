import 'package:flutter/material.dart';

class PendingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          ),
        ),
        ModalBarrier(
          dismissible: false,
          color: Colors.black.withOpacity(0.3),
        ),
      ],
    );
  }
}

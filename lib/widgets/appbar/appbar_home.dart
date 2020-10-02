import 'package:baru_nih/styles/mycolors.dart';
import 'package:baru_nih/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  final VoidCallback onTap;

  HomeAppBar({this.onTap})
      : super(
            elevation: APPBAR_ELEVATION,
            backgroundColor: MyColors.toolBarApp,
            flexibleSpace: _buildAppBar(onTap));

  static Widget _buildAppBar(VoidCallback _onTap) {
    return new Container(
      color: Colors.orangeAccent,
      padding: EdgeInsets.only(left: 40.0, right: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Image.asset(
            LOGO_ORANGE,
            // height: 56.0,
            width: 120.0,
          ),
          APP_DEV
              ? new Container(
                  child: new Row(
                    children: <Widget>[
                      InkWell(
                        onTap: _onTap,
                        child: new Container(
                          padding: EdgeInsets.all(6.0),
                          alignment: Alignment.centerRight,
                          child: new Icon(
                            // FontAwesomeIcons.qrcode,
                            // size: 22.0,
                            Icons.center_focus_weak,
                            size: 30.0,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

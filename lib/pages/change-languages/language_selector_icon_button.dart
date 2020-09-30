import 'package:baru_nih/styles/mycolors.dart';
import 'package:baru_nih/utils/routes.dart';
import 'package:flutter/material.dart';

class LanguageSelectorIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _languageIconTapped(context);
      },
      icon: Icon(
        Icons.settings,
        color: MyColors.appPrimaryText,
      ),
    );
  }

  _languageIconTapped(BuildContext context) {
    Navigator.of(context).pushNamed(CHANGE_LANGUAGES_SCREEN);
  }
}

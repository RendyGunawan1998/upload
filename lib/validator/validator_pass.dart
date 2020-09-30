import 'package:flutter/material.dart';


class passwordValidator{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String validatepass(value){
    if(value.isEmpty){
      return 'Required';
    }else{
      return null;
    }
  }
}
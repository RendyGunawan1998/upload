import 'package:flutter/material.dart';

class emailvalidator{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate(){
    if(formkey.currentState.validate()){
      print('Validate');
    }else{
      print('Not Valid');
    }
  }

  /*void emailEmpty() {
    validator : (value){
      if(value.isEmpty){
        return 'Required';
      }else{
        return null;
      }
    };
  }*/
}

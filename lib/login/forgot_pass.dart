/*
import 'package:baru_nih/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPass extends StatelessWidget{
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter Email',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: (){
                  resetPassword(context);
                },
                child: Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) async{
    if(editController.text.length == 0 || !editController.text.contains('@')){
      Fluttertoast.showToast(msg: 'Enter valid email ');
      return;
    }
    await FirebaseAuth.instance.sendPasswordResetEmail(
        email: editController.text);
    Fluttertoast.showToast(msg: 'Reset link has been send to your email,please use it');
    //Navigator.pop(context);
   // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }
}
*/

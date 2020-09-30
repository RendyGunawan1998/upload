/*
import 'package:baru_nih/home/home_page.dart';
import 'package:baru_nih/validator/validator_pass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email;
  String password;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('LOL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),),
              ),
              onPressed: _signInWithGoogle,
              color: Colors.black,
            )
          ],
        ),
        ),
      );
  }

  _signInWithGoogle() async{
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,accessToken: googleAuth.accessToken);
    final FirebaseUser user = (await firebaseAuth.signInWithCredential(credential)).user;
  }
}
*/

/*
import 'dart:html';
*/
import 'package:baru_nih/home/home_page.dart';
import 'package:baru_nih/login/forgot_pass.dart';
import 'package:baru_nih/login/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baru_nih/login/forgot_pass.dart';
import 'package:baru_nih/models/authentication.dart';
import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailCntroller = new TextEditingController();
  TextEditingController passCntroller = new TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _showErrorMessage(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An error occured'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!formkey.currentState.validate()) {
      return;
    }
    formkey.currentState.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .logIn(_authData['email'], _authData['password']);
      Navigator.of(context).pushReplacementNamed(MenuPage.routeName);
    } catch (error) {
      var errorMessage = 'Authentication failed, please try again!';
      _showErrorMessage(errorMessage);
    }
  }

  void dispose() {
    emailCntroller?.dispose();
    passCntroller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Text('Sign Up'), Icon(Icons.person_add)],
            ),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(SignupScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('wallpaper.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child :Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //autovalidate: true,
              child: Container(
                height: 260,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                              labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required email!';
                            }
                            /*else if (value.contains('@')) {
                            return 'Invalid email';
                          }*/
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value;
                            //emailCntroller.text=val;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                                labelText: 'Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Required password!';
                              } else if (value.length < 6) {
                                return 'Should be at least 6 characters';
                              } else if (value.length > 15) {
                                return 'Should not be more than 15 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          child: Text("LOGIN"),
                          onPressed: () {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.greenAccent,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /*GestureDetector(
                          child: Container
                            (alignment: Alignment.centerRight,
                              child: Text('Forgot Password?')),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => ForgotPass()));
                          },
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}

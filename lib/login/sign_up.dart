/*
import 'dart:html';

*/



import 'package:baru_nih/models/authentication.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baru_nih/login/login_screen.dart';
import 'package:baru_nih/login/login_screen.dart';
import 'login_page.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = "/signup";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController emailCntroller = new TextEditingController();
  TextEditingController passCntroller = new TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _showErrorMessage(String msg)
  {
    showDialog(context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occured'),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );
  }

  Future<void> _submit() async{
    if (!formkey.currentState.validate()) {
      return;
    }
    formkey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen: false)
          .signUp(_authData['email'],
          _authData['password']);
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }catch(error)
    {
      var errorMessage = 'Authentication failed, please try again!';
      _showErrorMessage(errorMessage);
    }
  }

  void dispose() {
    emailCntroller?.dispose();
    passCntroller?.dispose();
    super.dispose();
  }

  void validate() {
    if (formkey.currentState.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  String validatePass(value) {
    if (value.isEmpty) {
      return "Required Password!";
    } else {
      return null;
    }
  }

  String validateEmail(value) {
    if (value.isEmpty) {
      return "Required Email!";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Text('Login'), Icon(Icons.person)],
            ),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //autovalidate: true,
            child: Container(
              height: 300,
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
else if (value.contains('@')) {
                            return 'Invalid email';
                          }

                          return null;
                        },
                        onSaved: (value) {
                          //emailCntroller.text=val;
                          _authData['email'] = value;
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
                          controller: passCntroller,
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
                            //passCntroller.text=val;
                            _authData['password'] = value;
                          },
                        ),
                      ),
                      //confirm pass here
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required password!';
                            } else if (value.length < 6) {
                              return 'Should be at least 6 characters';
                            } else if (value.length > 15) {
                              return 'Should not be more than 15 characters';
                            } else if (value != passCntroller.text) {
                              return 'invalid confirm password, must same to password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            //passCntroller.text=val;
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loading() {
    if (mounted) {
      setState(() => isLoading = true);
    }
  }

  void validLogin() async {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      print("VALID");
      print("Email: " + emailCntroller.text);
      print("Password: " + passCntroller.text);
      loading();
      _login();
    } else {
      print("Validation error, can't do login");
    }
  }

  void _login() async {
    try {} catch (e) {
      setState(() {
        print(e);
      });
    }
  }
}

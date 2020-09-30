import 'dart:convert';

import 'package:baru_nih/providers/api.dart';
import 'package:baru_nih/providers/auth_provider.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onSignedIn;
  final VoidCallback onCustomerMode;

  LoginPage({Key key, this.onSignedIn, this.onCustomerMode}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool isLoading = false;
  // bool _isSelected = false;
  //

  TextEditingController teEmailController = new TextEditingController();
  TextEditingController tePasswordController = new TextEditingController();
  //TextEditingController tePasswordRController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _validate = false;

  @override
  void dispose() {
    teEmailController?.dispose();
    tePasswordController?.dispose();
    super.dispose();
  }

  void _toggleLogin() {
    if (mounted) {
      setState(() {
        _obscureTextLogin = !_obscureTextLogin;
      });
    }
  }

  // void _radio() {
  //   setState(() {
  //     _isSelected = !_isSelected;
  //   });
  // }

  Widget radioButton(bool isSelected) => Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.black)),
    child: isSelected
        ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    )
        : Container(),
  );

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil().setWidth(120),
      height: 1.0,
      color: Colors.black38.withOpacity(.2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    return SafeArea(
      child: new Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: true,
        // backgroundColor: MyColors.backgroundApp,
        body: Container(
          // decoration: new BoxDecoration(
          //   gradient: new LinearGradient(
          //       colors: [
          //         MyColors.loginGradientStart,
          //         MyColors.loginGradientEnd
          //       ],
          //       begin: const FractionalOffset(0.0, 0.0),
          //       end: const FractionalOffset(1.0, 1.0),
          //       stops: [0.0, 1.0],
          //       tileMode: TileMode.clamp),
          // ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Opacity(
                          //----------------------------------------------bg logo polisi----------------------------------------
                          opacity: 0.4,
                          child: Image.asset(
                            BACKGROUND_PROFILE,
                            width: MediaQuery.of(context).size.width * 0.9,
                            fit: BoxFit.cover,

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 70.0),
                  child: Column(
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     Image.asset(
                      //       //---------------------------------------logo polisi-----------------------------
                      //       LOGO_ORANGE,
                      //       width: 220,
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        //----------------------ketinggian dari box putih login------------------------

                        height: ScreenUtil().setHeight(130),
                      ),
                      Form(
                        key: _formKey,
                        autovalidate: _validate,
                        child: _buildFormCard(),

                      ),
                      SizedBox(height: ScreenUtil().setHeight(40)),
                      Row(
                        // ----------------------------------------------------------------Button Login_--------------------------------------------
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              width: ScreenUtil().setWidth(330),
                              height: ScreenUtil().setHeight(90),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF6078ea), Color(0XFF3164bd),
                                    // Color(0xFF17ead9),
                                    // Color(0xFF6078ea)
                                  ]),
                                  borderRadius: BorderRadius.circular(6.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                        Color(0xFF6078ea).withOpacity(.3),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 8.0)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    validateLoginAndSubmit("customer");
                                  },
                                  child: Center(
                                    child: isLoading
                                        ? CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor:
                                      AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    )
                                        : Text(
                                        allTranslations
                                            .text("login")
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Poppins-Bold",
                                            fontSize:
                                            ScreenUtil().setSp(50),
                                            letterSpacing: 1.0)),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: ScreenUtil.getInstance().setHeight(40),
                      // ),
                      // SizedBox(
                      //   height: ScreenUtil.getInstance().setHeight(40),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     SocialIcon(
                      //       colors: [
                      //         Color(0xFF102397),
                      //         Color(0xFF187adf),
                      //         Color(0xFF00eaf8),
                      //       ],
                      //       iconData: CustomIcons.facebook,
                      //       onPressed: () {},
                      //     ),
                      //     SocialIcon(
                      //       colors: [
                      //         Color(0xFFff4f38),
                      //         Color(0xFFff355d),
                      //       ],
                      //       iconData: CustomIcons.googlePlus,
                      //       onPressed: () {},
                      //     ),
                      //     SocialIcon(
                      //       colors: [
                      //         Color(0xFF17ead9),
                      //         Color(0xFF6078ea),
                      //       ],
                      //       iconData: CustomIcons.twitter,
                      //       onPressed: () {},
                      //     ),
                      //     SocialIcon(
                      //       colors: [
                      //         Color(0xFF00c6fb),
                      //         Color(0xFF005bea),
                      //       ],
                      //       iconData: CustomIcons.linkedin,
                      //       onPressed: () {},
                      //     )
                      //   ],
                      // ),
                      SizedBox(
                        height: ScreenUtil().setHeight(150),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Text(
                      //       "New User? ",
                      //       style: TextStyle(
                      //         fontFamily: "Poppins-Medium",
                      //         fontSize: ScreenUtil().setSp(24),
                      //       ),
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         print("register clicked");
                      //         _launchURL(REGISTER_URL);
                      //       },
                      //       child: Text(allTranslations.text("signup"),
                      //           style: TextStyle(
                      //             color: Colors.blue,
                      //             fontFamily: "Poppins-Bold",
                      //             fontSize: ScreenUtil().setSp(24),
                      //           )),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: ScreenUtil().setHeight(20),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard() {

    return Container(

      width: double.infinity,
      decoration: BoxDecoration(
        //--------------------------------------------------------------color box login-------------------------------------
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),

      child: Padding(
        //-----------------------------------------ukuran gede box putih----------------------
        padding: EdgeInsets.only(left: 25.0,right: 25.0,top: 40.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  //--------------------------------------------------------------------------logo K----------------------------------------------------------------
                  LOGO_ORANGE,
                  width: 220,
                ),
              ],
            ),
            //-----------------------------------------------------btn login----------------------------------------------------------
            Text(allTranslations.text("login"),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            /*Text(
              allTranslations.text("email"),
              style: TextStyle(
                  // color: MyColors.appPrimaryText,
                  fontFamily: "Poppins-Medium",
                  fontSize: ScreenUtil().setSp(30)),
            ),*/
            TextFormField(
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              onSaved: (String val) {
                teEmailController.text = val;
              },
              decoration: InputDecoration(
                hintText: allTranslations.text("email"),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenUtil().setSp(28),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            /*Text(
              allTranslations.text("password"),
              style: TextStyle(
                  fontFamily: "Poppins-Medium",
                  fontSize: ScreenUtil().setSp(30)),
            ),*/
            TextFormField(
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              obscureText: _obscureTextLogin,
              validator: validatePassword,
              onSaved: (String val) {
                tePasswordController.text = val;
              },
              decoration: InputDecoration(
                hintText: allTranslations.text("password"),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenUtil().setSp(28),
                ),
                suffixIcon: InkWell(
                  onTap: _toggleLogin,
                  child: Icon(
                    _obscureTextLogin
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    size: ScreenUtil().setSp(30),
                    color: MyColors.appPrimaryText,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: <Widget>[
            //     InkWell(
            //       onTap: () {
            //         print("forgot_password customer clicked");
            //         _launchURL(T_C_FORGOT_PASSWORD_URL);
            //       },
            //       child: Text(
            //         allTranslations.text("forgot_password"),
            //         style: TextStyle(
            //             color: Colors.blue,
            //             fontFamily: "Poppins-Medium",
            //             fontSize: ScreenUtil().setSp(24)),
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
          ],
        ),
      ),
    );
  }

  void validateLoginAndSubmit(String _provider) async {
    if (_formKey.currentState.validate()) {
      // No any error in validation
      _formKey.currentState.save();
      print("valid");
      print("Customer Login");
      print("email: " + teEmailController.text);
      print("password: " + tePasswordController.text);

      _showLoading();
      _doLogin();
    } else {
      print("validation error");
      if (mounted) {
        setState(() {
          _validate = true;
        });
      }
    }
  }

  void _showLoading() {
    if (mounted) {
      setState(() => isLoading = true);
    }
  }

  void _dismissLoading() {
    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  void _doLogin() async {
    try {
      await auth.login(teEmailController.text, tePasswordController.text);
      await _getAccountInfo();
      _dismissLoading();
      widget.onSignedIn();
    } catch (err) {
      _dismissLoading();
      print(err);
      showInSnackBar(context, _scaffoldKey, err, Colors.red);//context,scaffold,error nya apa, warna.
    }
  }

  _getAccountInfo() async {
    var auth = AuthProvider.of(context).auth;
    await auth.getAccountInfo().then((res) {
      print("AccountInfo: $res");
      // var data = json.decode(res).cast<String, dynamic>();
      // var userMode = data['provider'] == "customers" ? "customer" : "receiver";
      // print("_getAccountInfo: $userMode");
      widget.onCustomerMode();
    });
  }

  String validateEmail(String value) {
    // String pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    }
    // else if (!regExp.hasMatch(value)) {
    //   return "Invalid Email";
    // }
    else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return "Password is Required";
    } else if (!(value.length > 3)) {
      return "Password should contains more then 3 character";
    }
    return null;
  }
}

// _returnLoginField(IconData icon, bool isObscure) {
//   return new TextField(
//     obscureText: isObscure,
//     style: new TextStyle(fontSize: 15.0),
//     decoration: new InputDecoration(
//       icon: new Icon(icon, color: Colors.deepPurpleAccent),
//     ),
//   );
// }

// _returnPasswordField(IconData icon, bool isObscure) {
//   return new TextField(
//     obscureText: isObscure,
//     style: new TextStyle(fontSize: 15.0),
//     decoration: new InputDecoration(
//       icon: new Icon(icon, color: Colors.deepPurpleAccent),
//     ),
//   );
// }

// _returnLoginButton() {
//   return new FlatButton(
//     onPressed: () {},
//     child: new Text(
//       "LOGIN",
//       style: const TextStyle(
//         color: Colors.deepPurpleAccent,
//         fontSize: 20.0,
//       ),
//     ),
//   );
// }

// _returnForgotPassword() {
//   return new FlatButton(
//     onPressed: () {},
//     child: new Text(
//       "FORGOT PASSWORD?",
//       style: const TextStyle(
//         color: Colors.grey,
//         fontSize: 10.0,
//       ),
//     ),
//   );
// }

// _returnPrivacyText() {
//   return new FlatButton(
//     onPressed: () {},
//     child: new Column(
//       children: <Widget>[
//         new Text(
//           "By logging in you agree to our",
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 11.0,
//           ),
//         ),
//         new Text(
//           "privacy policy & terms of service",
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 11.0,
//           ),
//         ),
//       ],
//     ),
//   );
// }

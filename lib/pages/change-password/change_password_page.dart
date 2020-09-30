import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baru_nih/pages/xroot/rootPage.dart';
import 'package:baru_nih/providers/api.dart';
import 'package:baru_nih/providers/auth_provider.dart';
import 'package:baru_nih/utils/my_import.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController teCurrentPasswordController =
  new TextEditingController();
  TextEditingController teNewPasswordController = new TextEditingController();
  TextEditingController teConfirmNewPasswordConController =
  new TextEditingController();

  bool validate = false;
  bool isLoading = false;
  bool _obscureTextChangePassword1 = true;
  bool _obscureTextChangePassword2 = true;
  bool _obscureTextChangePassword3 = true;

  void _toggleVisible(int value) {
    if (mounted) {
      setState(() {
        if (value == 1) {
          _obscureTextChangePassword1 = !_obscureTextChangePassword1;
        } else if (value == 2) {
          _obscureTextChangePassword2 = !_obscureTextChangePassword2;
        } else {
          _obscureTextChangePassword3 = !_obscureTextChangePassword3;
        }
      });
    }
  }

  @override
  void dispose() {
    teCurrentPasswordController.dispose();
    teNewPasswordController.dispose();
    teConfirmNewPasswordConController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: APPBAR_ELEVATION,
          leading: BackButton(color: MyColors.black),
          title: Text(allTranslations.text("change_password"),
              style: TextStyle(color: MyColors.black)),
          backgroundColor: MyColors.menuMart,
        ),
        body: Stack(
          children: <Widget>[
            isLoading ? Loader() : _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: MyDimensions.kContainerPaddingInner,
        margin: MyDimensions.kContainerPaddingInner,
        child: Form(
          key: _formKey,
          // autovalidate: _validate,
          child: formUI(),
        ),
      ),
    );
  }

  Widget formUI() {
    return new Column(
      children: <Widget>[
        //=============================== PASS SAAT INI ====================================
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
          child: new TextFormField(
            keyboardType: TextInputType.text,
            obscureText: _obscureTextChangePassword1, //to hide pass jadi ****
            validator: validateEmpty,
            onSaved: (String val) {
              teCurrentPasswordController.text = val;
            },
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.lock),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(9.0),
                borderSide: new BorderSide(),
              ),
              labelText: allTranslations.text("enter_current_password"),
              suffixIcon: InkWell(
                onTap: () => _toggleVisible(1),
                child: Icon(
                  _obscureTextChangePassword1
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: ScreenUtil().setSp(30),
                  color: MyColors.appPrimaryText,
                ),
              ),
            ),
          ),
        ),
        //=============================== PASS  BARU ==========================================
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: new TextFormField(
            keyboardType: TextInputType.text,
            obscureText: _obscureTextChangePassword2,
            validator: validateEmpty,
            onSaved: (String val) {
              teNewPasswordController.text = val;
            },
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.lock_open),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(9.0),
                borderSide: new BorderSide(),
              ),
              labelText: allTranslations.text("enter_new_password"),
              suffixIcon: InkWell(
                onTap: () => _toggleVisible(2),
                child: Icon(
                  _obscureTextChangePassword2
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: ScreenUtil().setSp(30),
                  color: MyColors.appPrimaryText,
                ),
              ),
            ),
          ),
        ),

        //=============================== MASUKKAN ULANG PASS BARU ====================================
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: new TextFormField(
            keyboardType: TextInputType.text,
            obscureText: _obscureTextChangePassword3,
            validator: validateEmpty,
            onSaved: (String val) {
              teConfirmNewPasswordConController.text = val;
            },
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.lock_open),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(9.0),
                borderSide: new BorderSide(),
              ),
              labelText: allTranslations.text("enter_confirm_new_password"),
              suffixIcon: InkWell(
                onTap: () => _toggleVisible(3),
                child: Icon(
                  _obscureTextChangePassword3
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: ScreenUtil().setSp(30),
                  color: MyColors.appPrimaryText,
                ),
              ),
            ),
          ),
        ),
        //=============================== DISINI TOMBOL SEND ====================================
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF17ead9),
                    Color(0xFF6078ea)],
                ),
                borderRadius: BorderRadius.circular(6.0),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF6078ea).withOpacity(.3),
                      offset: Offset(0.0, 8.0),
                      blurRadius: 8.0)
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _onSend,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(allTranslations.text("send"),
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white)),
                        SizedBox(width: 10),
                        Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String validateEmpty(String value) {
    if (value.length == 0) {
      return "Field is Required";
    } else if (!(value.length > 2)) {
      return "Field should contains more then 2 character";
    }
    return null;
  }

  void _onSend() async {
    print("_onSend");
    if (_formKey.currentState.validate()) {
      // No any error in validation
      _formKey.currentState.save();

      try {
        _showLoading();

        var body = {
          "old_password": teCurrentPasswordController.text,
          "password": teNewPasswordController.text,
          "password_confirmation": teConfirmNewPasswordConController.text
        };
        await api.changePassword(body);

        _dismissLoading();
        _handleSuccess();
        print("chagePassword success!!");
      } catch (err) {
        _dismissLoading();
        showInSnackBar(context, _scaffoldKey, err, null);
      }
    } else {
      print("validation error");
      setState(() {
        validate = true;
      });
    }
  }

  void _handleSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(allTranslations.text("success")),
          content: Text(allTranslations.text("success_change_password")),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              textColor: MyColors.appPrimaryColor,
              child: Text(allTranslations.text("ok")),
              onPressed: () async {
                print(allTranslations.text("ok") + " clicked");
                await _goLogout();
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => RootPage()),
                        (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _goLogout() async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      print("LOGOUT");
    } catch (err) {
      print(err);
    }
  }

  void _showLoading() {
    setState(() => isLoading = true);
  }

  void _dismissLoading() {
    setState(() => isLoading = false);
  }
}

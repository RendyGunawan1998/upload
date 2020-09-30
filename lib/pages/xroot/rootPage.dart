import 'package:baru_nih/pages/login/login_page.dart';
import 'package:baru_nih/pages/xroot/tabPageCustomer.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:baru_nih/providers/auth_provider.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}

enum UserMode {
  user,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notDetermined;
  UserMode userMode = UserMode.user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var auth = AuthProvider.of(context).auth;
    auth.getoAuthData().then((token) {
      // print("Token: $token");
      if (mounted) {
        setState(() {
          authStatus =
          token == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
        });
      }
    });
    auth.getUserMode().then((res) {
      print("userMode RootPage: $res");
      if (mounted) {
        setState(() {
          userMode = UserMode.user;
        });
      }
    });
  }

  void _signedIn() {
    if (mounted) {
      setState(() {
        authStatus = AuthStatus.signedIn;
      });
    }
  }

  void _signedOut() {
    if (mounted) {
      setState(() {
        authStatus = AuthStatus.notSignedIn;
        userMode = null;
      });
    }
  }

  void _userMode() {
    if (mounted) {
      setState(() {
        userMode = UserMode.user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        return LoginPage(
          onSignedIn: _signedIn,
          onCustomerMode: _userMode,
        );
      case AuthStatus.signedIn:
        switch (userMode) {
          case UserMode.user:
            return TabPageCustomer(
              onSignedOut: _signedOut,
            );
            break;
        }
    }
    return null;
  }

  Widget _buildWaitingScreen() {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              child: Loader(),
            ),
          ],
        ),
      ),
    );
  }
}

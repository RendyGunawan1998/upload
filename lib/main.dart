/*
import 'package:baru_nih/home/home_page.dart';
import 'package:baru_nih/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:baru_nih/login/sign_up.dart';
import 'package:provider/provider.dart';
import 'models/authentication.dart';

import 'login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication()),
      ],
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(primaryColor: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        routes: {
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          MenuPage.routeName: (ctx) => MenuPage(),
        },
      ),
    );
    */
/*home: MyHomePage(title: 'Flutter demo page',),
   );*//*

  }
}
*/

import 'package:bloc/bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
// import 'package:camera/camera.dart';
import 'package:baru_nih/bloc/simple_bloc_delegate.dart';
import 'package:baru_nih/pages/change-languages/language_selector_page.dart';
import 'package:baru_nih/pages/change-password/change_password_page.dart';
import 'package:baru_nih/pages/change-logs/change_log_page.dart';
import 'package:baru_nih/main2.dart';
import 'package:baru_nih/styles/mycolors.dart';
import 'package:baru_nih/utils/all_translate.dart';
import 'package:baru_nih/utils/constants.dart';
import 'package:baru_nih/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:baru_nih/providers/auth_provider.dart';
import 'package:baru_nih/pages/xroot/rootPage.dart';
import 'package:baru_nih/providers/auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';

// List<CameraDescription> cameras;

main() async {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   // systemNavigationBarColor: Colors.blue, // navigation bar color
  //   statusBarColor: MyColors.statusBarApp, // status bar color
  // ));

  WidgetsFlutterBinding.ensureInitialized();

  // Initializes the translation module
  await allTranslations.init();

  // then start the application
  BlocSupervisor().delegate = SimpleBlocDelegate();
  // try {
  //   cameras = await availableCameras();
  // } on CameraException catch (e) {
  //   //logError(e.code, e.description);
  //   print(e);
  // }
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool _useWhiteStatusBarForeground;
  bool _useWhiteNavigationBarForeground;

  @override
  void initState() {
    super.initState();
    allTranslations.onLocaleChangedCallback = _onLocaleChanged;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (_useWhiteStatusBarForeground != null)
        FlutterStatusbarcolor.setStatusBarWhiteForeground(
            _useWhiteStatusBarForeground);
      if (_useWhiteNavigationBarForeground != null)
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(
            _useWhiteNavigationBarForeground);
    }
    super.didChangeAppLifecycleState(state);
  }

  changeStatusColor(Color color) async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
      if (useWhiteForeground(color)) {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
        _useWhiteStatusBarForeground = true;
        _useWhiteNavigationBarForeground = true;
      } else {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
        _useWhiteStatusBarForeground = false;
        _useWhiteNavigationBarForeground = false;
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  changeNavigationColor(Color color) async {
    try {
      await FlutterStatusbarcolor.setNavigationBarColor(color, animate: true);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  setStatusBarColor(Color color) {
    changeStatusColor(color);
    changeNavigationColor(color);
  }

  _onLocaleChanged() async {
    // do anything you need to do if the language changes
    print('Language has been changed to: ${allTranslations.currentLanguage}');
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(MyColors.statusBarApp);
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: APP_NAME,
          theme: ThemeData(
            primaryColor: MyColors.appPrimaryColor,
            primaryColorDark: MyColors.appPrimaryColor2,
            accentColor: Colors.blueAccent,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // Tells the system which are the supported languages
          supportedLocales: allTranslations.supportedLocales(),
          home: SplashPage(),
          routes: <String, WidgetBuilder>{
            // Set routes for using the Navigator.
            HOME_SCREEN: (BuildContext context) => new RootPage(),
            CHANGE_LANGUAGES_SCREEN: (BuildContext context) =>
            new LanguageSelectorPage(),
            CHANGE_PASSWORD_SCREEN: (BuildContext context) =>
            new ChangePasswordPage(),
            CHANGES_LOG_SCREEN: (BuildContext context) => new ChangesLogPage(),
          }),
    );
  }
}


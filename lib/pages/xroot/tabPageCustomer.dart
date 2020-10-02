import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:baru_nih/providers/auth_provider.dart';
import 'package:baru_nih/utils/routes.dart';
import 'package:package_info/package_info.dart';
import 'package:baru_nih/pages/customers/account/account.dart';
import 'package:baru_nih/pages/customers/home/home_page.dart';
import 'package:baru_nih/pages/customers/tunkin/tunkin_page.dart';
import 'package:baru_nih/pages/customers/tunjangan/tunjangan_page.dart';
import 'package:baru_nih/providers/api.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:baru_nih/pages/xroot/rootPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:baru_nih/pages/change-languages/language_selector_icon_button.dart';

String timestamp() => new DateTime.now().toString();

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class TabPageCustomer extends StatefulWidget {
  final VoidCallback onSignedOut;

  TabPageCustomer({Key key, this.onSignedOut}) : super(key: key);

  @override
  _TabPageCustomerState createState() => _TabPageCustomerState();
}

class _TabPageCustomerState extends State<TabPageCustomer> {
  AuthStatus authStatus = AuthStatus.signedIn;
  DateTime currentBackPressTime = DateTime.now();

  bool isLoading = false;

  int _currentTabIndex = 0;
  final Key keyTab1 = PageStorageKey('tab1');
  final Key keyTab2 = PageStorageKey('tab2');
  final Key keyTab3 = PageStorageKey('tab3');
  final Key keyTab4 = PageStorageKey('tab4');

  HomePage tab1;
  TunkinPage tab2;
  TunjanganPage tab3;
  AccountPage tab4;

  List<Widget> pages;
  Widget currentPage;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    initAppVersion();

    tab1 = HomePage(
      key: keyTab1,
      onSignedOut: widget.onSignedOut,
    );
    tab2 = TunkinPage(
      key: keyTab2,
      onSignedOut: widget.onSignedOut,
    );
    tab3 = TunjanganPage(
      key: keyTab3,
      onSignedOut: widget.onSignedOut,
    );
    tab4 = AccountPage(
      key: keyTab4,
      onSignedOut: widget.onSignedOut,
    );

    pages = [tab1, tab2, tab3,tab4];
    currentPage = tab1;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initAppVersion() async {
    try {
      Map _appVersion = await api.getAppVersion("puskeu");
      // print(_appVersion);
      if (_appVersion["status"] == 401) {
        print("message: Unauthenticated.");
        _forceLogout();
      } else {
        int _appVersionValue =
        int.parse(_appVersion["version"].replaceAll(r'.', ''));
        var _packageInfo = await PackageInfo.fromPlatform();
        int _packageInfoValue =
        int.parse(_packageInfo.version.replaceAll(r'.', ''));

        print("current version: ${_appVersion["version"]}");
        print("packageInfo version: ${_packageInfo.version}");

        if (_appVersionValue > _packageInfoValue) {
          print("NEED UPDATE");
          _buildUpdateAlert();
        }
      }
    } catch (err) {
      print(err);
    }
  }

  void _buildUpdateAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(allTranslations.text("info")),
          content: Text(allTranslations.text("message_app_update")),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              textColor: MyColors.appPrimaryColor,
              child: Text(allTranslations.text("cancel")),
              onPressed: () {
                //exit the app
                exit(0);
              },
            ),
            FlatButton(
              textColor: MyColors.appPrimaryColor,
              child: Text(allTranslations.text("update")),
              onPressed: () {
                // url launcher update
                _launchURL(Platform.isIOS
                    ? APP_LINK_UPDATE_IOS
                    : APP_LINK_UPDATE_ANDROID);
              },
            ),
          ],
        );
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print(allTranslations.text("could_not_launch"));
    }
  }

  Widget _buildBottomNavigationBar() {
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentTabIndex,
      onTap: (int index) {
        if (mounted) {
          setState(() {
            _currentTabIndex = index;
            currentPage = pages[index];
          });
        }
      },
      items: [
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.account_balance_wallet,
            color: MyColors.menuDeals,
          ),
          icon: new Icon(
            Icons.account_balance_wallet,
            color: Colors.grey,
          ),
          title: new Text("Gaji"),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.insert_chart,
            color: MyColors.menuDeals,
          ),
          icon: new Icon(
            Icons.insert_chart,
            color: Colors.grey,
          ),
          title: new Text("Tunkin"),
        ),
        // BottomNavigationBarItem(
        //   activeIcon: new Icon(
        //     Icons.clear_all,
        //     color: MyColors.appPrimaryColor,
        //   ),
        //   icon: new Icon(
        //     Icons.clear_all,
        //     color: Colors.grey,
        //   ),
        //   title: new Text(allTranslations.text("tab_completed")),
        // ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.attach_money,
            color: MyColors.menuDeals,
          ),
          icon: new Icon(
            Icons.attach_money,
            color: Colors.grey,
          ),
          title: new Text("Tunjangan"),
        ),

        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.account_circle,
            color: MyColors.menuDeals,
          ),
          icon: new Icon(
            Icons.account_circle,
            color: Colors.grey,
          ),
          title: new Text(allTranslations.text("tab_account")),
        ),
      ],
    );
  }
//======================================================TAKE TIME NOW===================================================
  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: allTranslations.text("message_exit_app"));
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return RootPage();
      case AuthStatus.signedIn:
        return Scaffold(
          body: WillPopScope(
            //======================Asking to user for sure to exit app?=========================
            onWillPop: _onWillPop,
            child: SafeArea(
              child: PageStorage(
                child: currentPage,
                bucket: bucket,
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
    }
    return null;
  }

  Widget _buildBottomNavigationBar2() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: GNav(
            gap: 16,
            activeColor: Colors.white,
            color: Colors.grey,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: MyColors.appPrimaryColor,
            tabs: [
              GButton(
                icon: Icons.account_balance_wallet,
                text: 'Gaji',
              ),
              GButton(
                icon: Icons.insert_chart,
                text: 'Tunkin',
              ),
              GButton(
                icon: Icons.attach_money,
                text: 'Tunjangan',
              ),
              GButton(
                icon: Icons.account_circle,
                text: allTranslations.text("tab_account"),
              ),
            ],
            selectedIndex: _currentTabIndex,
            onTabChange: (index) {
              setState(() {
                _currentTabIndex = index;
                currentPage = pages[index];
              });
            }),
      ),
    );
  }

  Widget _kiri(){
    return Scaffold(
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('User_Account '),
              accountEmail: Text('User_Email@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.red),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new AccountPage()));
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.lock_open,
                  color: Colors.blue,),
              ),
            ),
           /* InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Option 2'),
                leading: Icon(Icons.lock_open,
                  color: Colors.blue,),
              ),
            ),*/
            Divider(thickness: 1),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Change Log'),
                leading: Icon(Icons.info,
                  color: Colors.grey,),
              ),
            ),
            InkWell(
              onTap: _goChangePassword,
              child: ListTile(
                title: Text('Change Password'),
                leading: Icon(Icons.lock_open,
                  color: Colors.blue,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=> new LanguageSelectorIconButton()));
              },
              child: ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings,
                  color: Colors.grey,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.power_settings_new,
                  color: Colors.grey,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goChangePassword() {
    print("_goChangePassword");
    Navigator.of(context).pushNamed(CHANGE_PASSWORD_SCREEN);
  }

  void _showLoading(){
    setState(() => isLoading=true);
  }

  void _dismissLoading(){
    setState(() => isLoading=false);
  }

  Future<void> _goLogout() async{
    try{
      _showLoading();
      var auth = AuthProvider.of(context).auth;
      await auth.giveDelay(1000);
      await auth.forceSignOut();
      _dismissLoading();
      print('Log Out');
      widget.onSignedOut();
    }catch(err){
      print(err);
      _dismissLoading();
    }
  }

  void _forceLogout() async {
    try {
      await auth.forceSignOut();
      print("LOGOUT");
      widget.onSignedOut();
    } catch (err) {
      print(err);
    }
  }
}

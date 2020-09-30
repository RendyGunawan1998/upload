import 'package:baru_nih/gaji/gaji_page.dart';
import 'package:baru_nih/login/login_screen.dart';
//import 'package:baru_nih/profile/profile_page.dart';
import 'package:baru_nih/tunjangan/tunjangan_page.dart';
import 'package:baru_nih/tunkin/tunkin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void menu() {
  runApp(MaterialApp(
    color: Colors.yellowAccent,
    home: MenuPage(),
  ));
}

class MenuPage extends StatefulWidget {

  static const routeName = "/home";
 const MenuPage({Key key, @required this.user}) : super(key: key);
  final FirebaseAuth user;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

  final List<Widget> _changePage = [
    GajiPage(),
    TunkinPage(),
    TunjanganPage(),
  ];

void onTapBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text('NEW'),
 actions: <Widget>[
        ],

      ),

      drawer: new Drawer(
        child: new ListView(
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

            //body here
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new PersonelPage()));
              },
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Tunkin'),
                leading: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Tunjangan'),
                leading: Icon(
                  Icons.attach_money,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            Divider(thickness: 1,),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Change Password'),
                leading: Icon(Icons.lock_open, color: Colors.blue),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Change Log'),
                leading: Icon(Icons.info, color: Colors.grey),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new LoginScreen()));
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.power_settings_new, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body:
      _changePage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text("Gaji"),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text("Tunkin"),
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text("Tunjangan"),
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Akun"),
            backgroundColor: Colors.blue,
          ),

        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

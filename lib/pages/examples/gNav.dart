import 'package:baru_nih/utils/my_import.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleTabBarPage extends StatefulWidget {
  final VoidCallback onSignedOut;

  GoogleTabBarPage({Key key, this.onSignedOut}) : super(key: key);

  @override
  _TGoogleTabBarPageState createState() => _TGoogleTabBarPageState();
}

class _TGoogleTabBarPageState extends State<GoogleTabBarPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;

  List<GButton> tabs = new List();
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600],
    Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          color: colors[selectedIndex],
          child: Center(
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(.20),
                    offset: Offset(0, 15))
              ]),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
                child: GNav(
                    gap: 8,
                    color: Colors.grey[800],
                    activeColor: Colors.purple,
                    iconSize: 24,
                    tabBackgroundColor: Colors.purple.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    duration: Duration(milliseconds: 1000),
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.headset,
                        text: 'Likes',
                      ),
                      GButton(
                        icon: Icons.search,
                        text: 'Search',
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onTabChange: (index) {
                      print(index);
                      setState(() {
                        selectedIndex = index;
                      });
                    }),
              ),
            ),
          ),
        ));
  }
}

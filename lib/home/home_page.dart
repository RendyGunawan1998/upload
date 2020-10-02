/*
// import 'package:baru_nih/gaji/gaji_page.dart';
// import 'package:baru_nih/login/login_screen.dart';
// //import 'package:baru_nih/profile/profile_page.dart';
// import 'package:baru_nih/tunjangan/tunjangan_page.dart';
// import 'package:baru_nih/tunkin/tunkin_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void menu() {
//   runApp(MaterialApp(
//     color: Colors.yellowAccent,
//     home: MenuPage(user: null,),
//   ));
// }

// class MenuPage extends StatefulWidget {

//   static const routeName = "/home";
//  const MenuPage({Key key, @required this.user}) : super(key: key);
//   final FirebaseAuth user;

//   @override
//   _MenuPageState createState() => _MenuPageState();
// }

// class _MenuPageState extends State<MenuPage> {
//   int _currentIndex = 0;

//   final List<Widget> _changePage = [
//     GajiPage(),
//     TunkinPage(),
//     TunjanganPage(),
//   ];

// void onTapBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget image_carousel = new Container(
//       height: 200.0,
//     );
//     return Scaffold(
//       appBar: new AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.red,
//         title: Text('NEW'),
//  actions: <Widget>[
//         ],

//       ),

//       drawer: new Drawer(
//         child: new ListView(
//           children: <Widget>[
//             new UserAccountsDrawerHeader(
//               accountName: Text('User_Account '),
//               accountEmail: Text('User_Email@gmail.com'),
//               currentAccountPicture: GestureDetector(
//                 child: new CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               decoration: new BoxDecoration(color: Colors.red),
//             ),

//             //body here
//             InkWell(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> new PersonelPage()));
//               },
//               child: ListTile(
//                 title: Text('My Account'),
//                 leading: Icon(
//                   Icons.person,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Home Page'),
//                 leading: Icon(
//                   Icons.home,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Tunkin'),
//                 leading: Icon(
//                   Icons.person,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Tunjangan'),
//                 leading: Icon(
//                   Icons.attach_money,
//                   color: Colors.greenAccent,
//                 ),
//               ),
//             ),
//             Divider(thickness: 1,),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Change Password'),
//                 leading: Icon(Icons.lock_open, color: Colors.blue),
//               ),
//             ),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 title: Text('Change Log'),
//                 leading: Icon(Icons.info, color: Colors.grey),
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> new LoginScreen()));
//               },
//               child: ListTile(
//                 title: Text('Log Out'),
//                 leading: Icon(Icons.power_settings_new, color: Colors.grey),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body:
//       _changePage[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_balance_wallet),
//             title: Text("Gaji"),
//             backgroundColor: Colors.red,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.assessment),
//             title: Text("Tunkin"),
//             backgroundColor: Colors.blueGrey,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.attach_money),
//             title: Text("Tunjangan"),
//             backgroundColor: Colors.redAccent,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             title: Text("Akun"),
//             backgroundColor: Colors.blue,
//           ),

//         ],
//         onTap: (index){
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }


import 'package:baru_nih/models/application/data_gaji.dart';
import 'package:baru_nih/providers/api.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:baru_nih/widgets/errors/loaddata_error.dart';
import 'package:baru_nih/widgets/images/no_data_widget.dart';
import 'package:baru_nih/widgets/loaders/custom_circular_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baru_nih/widgets/user/PersonelProfile.dart';
import 'package:baru_nih/widgets/user/UserGaji.dart';
import './blocs/index.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onSignedOut;

  HomePage({Key key, this.onSignedOut}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final HomeBloc _homeBloc = HomeBloc();

  List years = [];
  List months = [];
  String _bulan = "";
  String _tahun = "";
  String _bulanTahun = "";

  void initState() {
    super.initState();
    getYears();
    _tahun = MyDateFormat.getCurrentYear();
    _bulan = MyDateFormat.getCurrentMonth();
    setBulanTahun(_tahun, _bulan);
    _homeBloc.dispatch(HomeFetch(bulanTahun: _bulanTahun));
  }

  void getYears() {
    var now = new DateTime.now().year;
    List<int> abc = [];
    for (var i = 0; i <= 2; i++) {
      // print(year - i);
      abc.add(now - i);
    }

    years = abc.map((item) {
      return {
        "display": item.toString(),
        "value": item.toString(),
      };
    }).toList();
  }

  @override
  void dispose() {
    _disposeBloc();
    super.dispose();
  }

  void _disposeBloc() {
    _homeBloc.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: true,
      appBar: HomeAppBar(),
      body: _buildBody(),
      backgroundColor: Colors.white60,
      bottomNavigationBar: _bottomAppBarContents(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder(
      bloc: _homeBloc,
      builder: (BuildContext context, HomeBlocState state) {
        if (state is HomeUninitialized) {
          // return CustomCircularProgressIndicator();
          return Loader();
        }
        if (state is HomeDataError) {
          // print(state.dataError.code);
          if (state.dataError.code == 401) {
            // print(state.dataError.message);
            _forceLogout();
          }
          return LoadDataError(
            title: allTranslations.text("problem_occurred"),
            subtitle: state.dataError.message,
            bgColor: MyColors.menuDeals,
          );
        }
        if (state is HomeDataLoaded) {
          if (state.dataList.gaji.nrp == null) {
            return NoDataWidget(
              //-----------------------------data ketika filter tidak ada bulan ini-------------------

              title: allTranslations.text("no_data_processed"),
              subTitle: allTranslations.text("no_data_found"),
            );
          }
          return _buildBodyData(context, state.dataList);
        }
        return CustomCircularProgressIndicator();
      },
    );
  }

  Widget _buildBodyData(BuildContext context, DataGaji data) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        //----------------------------------------Build data user di gaji---------------------------
        _buildPersonelProfile(data),
        UserGajiWidget(data: data),
      ],
    );
  }

  Widget _buildPersonelProfile(DataGaji data) {
    return PersonelProfileWidget(data: data);
  }

  Widget _bottomAppBarContents() {
    return BottomAppBar(
      elevation: APPBAR_ELEVATION,
      child: Container(
        // height: 44.0,
        decoration: MyStyles.bottomAppBarDecorationInspectorFilter(),
        child: Row(
          //-------------------------------------------------tampilan  filter di gaji-----------------------------------------------

          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //----------------------------------tombol press button filter luar--------------------
            FlatButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return _buildFilterBottomSheet();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //------------------------------------bagian filter di home--------------------------------
                  Icon(
                    Icons.tune,
                    color: MyColors.lightBlue,
                    size: 22,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    allTranslations.text("filter"),
                    style: TextStyle(
                      color: MyColors.lightBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterBottomSheet() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            height: 310.0,
            decoration: BoxDecoration(
              //-------------------------------------box setelah button fitter--------------------------------------------

                borderRadius: BorderRadius.circular(4.0), color: Colors.white38),
            child: Column(children: <Widget>[
              Icon(
                Icons.drag_handle,
                color: Colors.grey.shade400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      allTranslations.text("filter"),
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  FlatButton(
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_forward,
                      color: Colors.green,
                      //style: TextStyle(fontSize: 20.0),
                      //------------------------------------------------------------button close di dalam filter----------------------------------

                      //allTranslations.text("close"),
                      //style: TextStyle(color: MyColors.green),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10.0),
              Divider(thickness: 1),
              Container(
                //--------------------------------------------------------------menu tahun dan bulan -------------------------------------------
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width:MediaQuery.of(context).size.width*0.45,
                          //padding: EdgeInsets.only(bottom: 0),
                          child: DropDownFormField(
                            titleText: allTranslations.text("year"),
                            hintText: allTranslations.text("select_year_hint"),
                            value: _tahun,
                            // onSaved: (value) {
                            //   setState(() {
                            //     _tahun = value;
                            //   });
                            // },
                            onChanged: (value) {
                              setState(() {
                                _tahun = value;
                              });
                            },
                            dataSource: years,
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          width : MediaQuery.of(context).size.width*0.45,
                          child: DropDownFormField(
                            titleText: allTranslations.text("month"),
                            hintText: allTranslations.text("select_month_hint"),
                            value: _bulan,
                            // onSaved: (value) {
                            //   setState(() {
                            //     _bulan = value;
                            //   });
                            // },
                            onChanged: (value) {
                              setState(() {
                                _bulan = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Januari",
                                "value": "01",
                              },
                              {
                                "display": "Februari",
                                "value": "02",
                              },
                              {
                                "display": "Maret",
                                "value": "03",
                              },
                              {
                                "display": "April",
                                "value": "04",
                              },
                              {
                                "display": "Mei",
                                "value": "05",
                              },
                              {
                                "display": "Juni",
                                "value": "06",
                              },
                              {
                                "display": "Juli",
                                "value": "07",
                              },
                              {
                                "display": "Agustus",
                                "value": "08",
                              },
                              {
                                "display": "September",
                                "value": "09",
                              },
                              {
                                "display": "Oktober",
                                "value": "10",
                              },
                              {
                                "display": "November",
                                "value": "11",
                              },
                              {
                                "display": "Desember",
                                "value": "12",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                      ],
                    ),

                    new SizedBox(height: 40,),
                    Text("You choose : $_bulan-$_tahun"),
                    //SizedBox(height: 16),
                    Container(
                      width: 100, // pake ini kalo error MediaQuery.of(context).size.width
                      padding: EdgeInsets.all(8),
                      child: RaisedButton(
                        color: MyColors.lightYellow,
                        child: Text(
                          allTranslations.text("filter"),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          _saveFilter();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }

  void setBulanTahun(String year, String month) {
    _bulanTahun = year + "-" + month;
    print(_bulanTahun);
  }

  void _saveFilter() {
    setBulanTahun(_tahun, _bulan);
    print(_bulanTahun);
    _homeBloc.dispatch(HomeUpdate(bulanTahun: _bulanTahun));
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

class MyTabs extends SliverPersistentHeaderDelegate {
  final double size;

  MyTabs(this.size);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // double width = MediaQuery.of(context).size.width;
    return Container(
      // alignment: Alignment.center,
      // color: Colors.orange.shade300,
      color: MyColors.lightYellow,
      height: size,
      child: TabBar(
        labelColor: Colors.black87,
        unselectedLabelColor: Colors.black26,
        indicatorColor: Colors.black26,
        // indicatorSize: TabBarIndicatorSize.label,
        // isScrollable: true,
        tabs: <Widget>[
          Tab(
            child: Container(
              // width: width * 0.5,
              // color: Colors.brown,
                child: Text(
                  "Gaji".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          Tab(
            icon: Container(
              // width: width * 0.5,
              child: Text(
                "Tunkin".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => size;

  @override
  bool shouldRebuild(MyTabs oldDelegate) {
    return oldDelegate.size != size;
  }
}
*/

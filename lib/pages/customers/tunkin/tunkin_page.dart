import 'package:baru_nih/home_bloc/index.dart';
import 'package:baru_nih/models/application/tunkin.dart';
import 'package:baru_nih/models/application/user_info.dart';
import 'package:baru_nih/pages/customers/account/account.dart';
import 'package:baru_nih/pages/customers/account/blocs/index.dart';
import 'package:baru_nih/pages/customers/tunkin/blocs/bloc.dart';
import 'package:baru_nih/utils/routes.dart';
import 'package:baru_nih/widgets/diagonally_cut_colored_image.dart';
import 'package:baru_nih/widgets/images/no_data_tunkin.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:baru_nih/models/application/data_gaji.dart';
import 'package:baru_nih/providers/auth_provider.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:baru_nih/widgets/errors/loaddata_error.dart';
import 'package:baru_nih/widgets/images/no_data_widget.dart';
import 'package:baru_nih/widgets/loaders/custom_circular_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baru_nih/widgets/user/PersonalProfileTunkinWidget.dart';
import 'package:baru_nih/widgets/user/UserTunkin.dart';

import 'package:baru_nih/pages/customers/tunkin/blocs/bloc.dart';
import 'package:baru_nih/pages/customers/tunkin/blocs/bloc_event.dart';
import 'package:baru_nih/pages/customers/tunkin/blocs/bloc_state.dart';
import 'package:baru_nih/pages/customers/tunkin/blocs/index.dart';


class TunkinPage extends StatefulWidget {
  final VoidCallback onSignedOut;

  TunkinPage({Key key, this.onSignedOut}) : super(key: key);

  @override
  _TunkinPageState createState() => _TunkinPageState();
}

class _TunkinPageState extends State<TunkinPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final TunkinBloc _tunkinBloc = TunkinBloc();
  final HomeBloc _homeBloc = HomeBloc();
  final AccountBloc _accountBloc = AccountBloc();


  bool isLoading = false;

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
    _tunkinBloc.dispatch(TunkinFetch(bulanTahun: _bulanTahun));//error disni //Karena ga ad value di dalam tunkin fetch
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
    _tunkinBloc.dispose();
    _scrollController.dispose();
  }

  Widget _getDrawer(){
    return Drawer(
      child:_getData(),
    );
  }

  Widget _getData(){
    return BlocBuilder(
      bloc: _accountBloc..dispatch(AccountFetch()),
      builder: (context,state){
        if(state is AccountDataError){
          return LoadDataError(
            title: allTranslations.text("problem_occured"),
            subtitle: allTranslations.text("something_went_wrong"),
            bgColor: MyColors.menuDeals,
          );
        }
        if(state is AccountDataLoaded){
          if(state.dataList.nrp==null){
            return NoTunkinWidget(
              title: allTranslations.text("no_data"),
              subTitle: allTranslations.text("no_data_found"),
            );
          }
          return ListView(
            children: <Widget>[
              _buildHeader(context, state.dataList),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=> new AccountPage()
                      ));
                },
                child: ListTile(
                  title: Text("My Account"),
                  leading:  Icon(
                    Icons.person,
                    color : Colors.black87,
                  ),
                ),
              ),
              Divider(height: 185),
              InkWell(
                onTap: (){
                  print("_goChangePassword");
                  Navigator.of(context).pushNamed(CHANGE_PASSWORD_SCREEN);
                },
                child: ListTile(
                  title: Text("Change Password"),
                  leading:  Icon(
                    Icons.lock_open,
                    color : Colors.blue,
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  print("_goChangeLog");
                  Navigator.of(context).pushNamed(CHANGES_LOG_SCREEN);
                },
                child: ListTile(
                  title: Text("Change Log"),
                  leading: Icon(
                    Icons.info,
                    color: Colors.grey,
                  ),
                ),
              ),
              Divider(thickness: 1),
              InkWell(
                onTap: _goLogout,
                child: ListTile(
                  title: Text("Log Out"),
                  leading: Icon(
                    Icons.power_settings_new,
                    color: Colors.redAccent,
                  ),
                ),
              )
            ],
          );
        }
        return CustomCircularProgressIndicator();
      },
    );
  }
  Widget _buildHeader(BuildContext context,UserInfo data){
    return Stack(
      children: <Widget>[
        _buildDiagonalImageBackground(context),
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.2,
          child: Column(
            children: <Widget>[
              _buildCardProfile(data,)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCardProfile(UserInfo data){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children:<Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.asset(
                      DEFAULT_PROFILE_IMAGE,
                      fit: BoxFit.cover,
                    ),
                  ),
                  radius: 28.0,
                ),
                title: Text(data.nmpeg.toUpperCase()),
                subtitle: Text(
                  data.nmgol1 == null || data.nmgol1 == '-'
                      ? data.nrp
                      : data.nmgol1,
                ),
              )
            ],
          ),
        ),
        ],
      ),
    );
  }

  Widget _buildDiagonalImageBackground(BuildContext context){
    var screenWidth = MediaQuery.of(context).size.width;
    return DiagonallyCutColoredImage(
      Image.asset(
        BACKGROUND_PROFILE,
        height: 180.0,
        width: screenWidth,
        fit: BoxFit.cover,
      ),
      color: const Color(0x22FA6F1E),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        title: Text("Tunkin", style: TextStyle(
            color: MyColors.black,
          fontSize: 26,
        )),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: _getDrawer(),
      body: _buildBody(),
     bottomNavigationBar: _bottomAppBarContents(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder(
      bloc: _tunkinBloc,
      builder: (BuildContext context, TunkinBlocState state) {
        if (state is TunkinUninitialized) {
          // return CustomCircularProgressIndicator();
          return Loader();
        }
        if (state is TunkinDataError) {
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
        if (state is TunkinDataLoaded) {
          if (state.dataList.nrp == null) {
            return NoTunkinWidget(
              title: allTranslations.text("data_in_processed"),
              subTitle: allTranslations.text("no_data_found"),
            );
          }
          return _buildBodyData(context, state.dataList);
        }
        return CustomCircularProgressIndicator();
      },
    );
  }

  //====================== BAGIAN TENGAH =================
  Widget _buildBodyData(BuildContext context, Tunkin data) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        PersonelProfileTunkinWidget(data: data), //PersonalProfileTunkinWidget.dart //typo=)
        UserTunkinWidget(data: data),
      ],
    );
  }

  Widget _bottomAppBarContents() {
    return BottomAppBar(
      elevation: APPBAR_ELEVATION,
      child: Container(
        // height: 44.0,
        decoration: MyStyles.bottomAppBarDecorationInspectorFilter(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
            height: 360.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), color: Colors.white),
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
                  OutlineButton(
                    color: MyColors.green,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      allTranslations.text("close"),
                      style: TextStyle(color: MyColors.green),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10.0),
              Divider(thickness: 1),
              Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: DropDownFormField(
                          titleText: allTranslations.text("year"),
                          hintText: allTranslations.text("select_year_hint"),
                          value: _tahun,
                          onSaved: (value) {
                            setState(() {
                              _tahun = value;
                            });
                          },
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
                        child: DropDownFormField(
                          titleText: allTranslations.text("month"),
                          hintText: allTranslations.text("select_month_hint"),
                          value: _bulan,
                          onSaved: (value) {
                            setState(() {
                              _bulan = value;
                            });
                          },
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
                      SizedBox(height: 16),
                      Container(
                        width: MediaQuery.of(context).size.width,
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
                ),
              )
            ]),
          );
        });
  }

  void _showLoading(){
    setState(()=> isLoading = true);
  }
  void _dismissLoading(){
    setState(()=> isLoading = false);
  }

  Future<void> _goLogout() async {
    try{
      _showLoading();
      var auth= AuthProvider.of(context).auth;
      await auth.giveDelay(1000);
      await auth.signOut();
      _dismissLoading();
      print('LOGOUT');
      widget.onSignedOut();
    }catch(err){
      print(err);
      _dismissLoading();
    }
  }

  void setBulanTahun(String year, String month) {
    _bulanTahun = year + "-" + month;
    print(_bulanTahun);
  }

  void _saveFilter() {
    setBulanTahun(_tahun, _bulan);
    print(_bulanTahun);
    _tunkinBloc.dispatch(TunkinUpdate(bulanTahun: _bulanTahun)); //error disni //Karena ga ad value di dalam tunkin update
  }

  void _forceLogout() async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.forceSignOut();
      print("LOGOUT");
      widget.onSignedOut();
    } catch (err) {
      print(err);
    }
  }
}
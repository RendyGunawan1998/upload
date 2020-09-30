import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:baru_nih/models/application/data_gaji.dart';
import 'package:baru_nih/pages/customers/home/blocs/index.dart';
import 'package:baru_nih/providers/auth_provider.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:baru_nih/widgets/errors/loaddata_error.dart';
import 'package:baru_nih/widgets/images/no_data_widget.dart';
import 'package:baru_nih/widgets/loaders/custom_circular_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baru_nih/widgets/user/PersonelProfile.dart';
import 'package:baru_nih/widgets/user/UserTunkin.dart';

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
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        title: Text("Tunkin", style: TextStyle(color: MyColors.black)),
        backgroundColor: Colors.orangeAccent,
      ),
      body: _buildBody(),
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
        //===========================CLOSE HERE==============================
        /*if (state is HomeDataLoaded) {
          if (state.dataList.tunkin.nrp == null) {
            return NoDataWidget(
              title: allTranslations.text("data_in_processed"),
              subTitle: allTranslations.text("no_data_found"),
            );
          }
          return _buildBodyData(context, state.dataList);
        }*/
        return CustomCircularProgressIndicator();
      },
    );
  }

  Widget _buildBodyData(BuildContext context, DataGaji data) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        PersonelProfileWidget(data: data),
        //===========================CLOSE HERE==============================
        //UserTunkinWidget(data: data.tunkin),
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
      var auth = AuthProvider.of(context).auth;
      await auth.forceSignOut();
      print("LOGOUT");
      widget.onSignedOut();
    } catch (err) {
      print(err);
    }
  }
}

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

class TunjanganPage extends StatefulWidget {
  final VoidCallback onSignedOut;

  TunjanganPage({Key key, this.onSignedOut}) : super(key: key);

  @override
  _TunjanganPageState createState() => _TunjanganPageState();
}

class _TunjanganPageState extends State<TunjanganPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final HomeBloc _homeBloc = HomeBloc();


  void initState() {
    super.initState();
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
        title: Text("Tunjangan", style: TextStyle(color: MyColors.black)),
        //backgroundColor: MyColors.toolBarApp,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: MyColors.grey200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0))),
            child: ListTile(
              title: Text(
                "Detail Gaji".toUpperCase(),
                style: TextStyle(color: MyColors.appPrimaryText),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
            child: _buildBodyGaji(),
          ),
        ],
      )
      // bottomNavigationBar: _bottomAppBarContents(),
    );
  }

  Widget _buildBodyGaji() {
    //Padding(padding: EdgeInsets.only(top: 4, bottom: 4, right: 4));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("Gaji Pokok :",
                textAlign: TextAlign.left,
                style: TextStyle(

                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan istri/suami :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan anak :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),new Text("tunjangan umum :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),new Text("tunjangan struktur :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan fungsi :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan papua :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan terpencil :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan bulat :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan beras :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan lauk :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan pajak :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan batas :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("Gaji Pokok :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan istri/suami :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan anak :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),new Text("tunjangan umum :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),new Text("tunjangan struktur :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan fungsi :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan papua :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan terpencil :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan bulat :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan beras :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan lauk :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan pajak :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              new Text("tunjangan batas :",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
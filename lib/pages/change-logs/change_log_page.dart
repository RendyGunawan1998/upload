import 'package:baru_nih/utils/my_import.dart';

class ChangesLogPage extends StatefulWidget {
  @override
  _ChangesLogPageState createState() => _ChangesLogPageState();
}

class _ChangesLogPageState extends State<ChangesLogPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: APPBAR_ELEVATION,
          leading: BackButton(color: MyColors.black),
          title: Text(allTranslations.text("changes_log"),
              style: TextStyle(color: MyColors.black)),
          backgroundColor: MyColors.menuMart,
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        _build_103(),
        Divider(height: 1),
        _build_102(),
        Divider(height: 1),
        _build_101(),
        Divider(height: 1),
      ],
    );
  }

  Widget _build_103() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "1.0.3",
            textScaleFactor: 1.2,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 10, bottom: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.lens,
                      size: 10,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text("Penambahan potongan BPJS di Halaman Gaji."),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _build_102() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "1.0.2",
            textScaleFactor: 1.2,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 10, bottom: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.lens,
                      size: 10,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text("Penambahan Halaman Tunkin."),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _build_101() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "1.0.2",
            textScaleFactor: 1.2,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 10, bottom: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.lens,
                      size: 10,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text("Initial version."),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

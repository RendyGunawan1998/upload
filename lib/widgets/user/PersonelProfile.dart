import 'package:baru_nih/models/application/data_gaji.dart';
//import 'package:baru_nih/models/tunkin.dart';
import 'package:baru_nih/models/application/user_info.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:baru_nih/widgets/user/BodyItem.dart';

class PersonelProfileWidget extends StatelessWidget {
  final DataGaji data;

  PersonelProfileWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          _buildHeader(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor:
            MyColors.getRandomColor(data.gaji.nmpeg.replaceAll(" ", "").length),
        child: Text(
          data.gaji.nmpeg[0].toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      title: Text(
        data.gaji.nmpeg,
        textScaleFactor: 1.1,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(data.gaji.nrp),
      trailing: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (context) {
                return _buildBottomSheet(context);
              });
        },
        child: Text(
          "Details".toUpperCase(),
          style: TextStyle(
            color: MyColors.menuBluebird,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return StatefulBuilder(builder: (c, s) {
      return Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        width: double.infinity,
        // height: 380,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0), color: Colors.white),

        // ============================= DATA PERSONEL PADA DETAIL ==================================
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                      "Data Personel".toUpperCase(),
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
              //==========================================CLOSE HERE=========================
              /*Padding(
                padding: EdgeInsets.all(8.0),
                child: _buildUserInfo(context, data.gaji, data.tunkin),
              ),*/
            ],
          ),
        ),
      );
    });
  }

  Widget _buildUserInfo(
      BuildContext context, UserInfo data,
      //==========================================CLOSE HERE=========================
      //Tunkin dataTunkin
      ) {
    var _margin = EdgeInsets.symmetric(vertical: 4);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BodyItemWidget(
          "Nama".toUpperCase(),
          data.nmpeg.toUpperCase(),
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
        BodyItemWidget(
          "NRP/NIP".toUpperCase(),
          data.nrp.toUpperCase(),
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
        BodyItemWidget(
          "Tanggal Lahir".toUpperCase(),
          MyDateFormat.convertDateFromStringGeneral(data.tgllhr),
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
        BodyItemWidget(
          "Umur".toUpperCase(),
          MyDateFormat.calculateAge(data.tgllhr),
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
        //==========================================CLOSE HERE=========================
        /*BodyItemWidget(
          "Pangkat".toUpperCase(),
          dataTunkin.pangkat == null
              ? data.nmgol1.toUpperCase() ?? ""
              : dataTunkin.pangkat.toUpperCase() ?? "",
          Colors.orange.shade800,
          _margin,
          textAlign: TextAlign.left,
        ),*/
        //==========================================CLOSE HERE=========================
        /*BodyItemWidget(
          "Jabatan".toUpperCase(),
          dataTunkin.jabatan == null
              ? data.sebutjab.toUpperCase() ?? ""
              : dataTunkin.jabatan.toUpperCase() ?? "",
          null,
          _margin,
          textAlign: TextAlign.left,
        ),*/
        BodyItemWidget(
          "Satker".toUpperCase(),
          data.satker.nmsatker,
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
        BodyItemWidget(
          "Polda".toUpperCase(),
          data.satker.polda.nmuappaw,
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
        BodyItemWidget(
          "TMT Pangkat Terakhir".toUpperCase(),
          MyDateFormat.convertDateFromStringGeneral(data.tmtpangkat),
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
        BodyItemWidget(
          "NPWP".toUpperCase(),
          data.npwp,
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
        BodyItemWidget(
          "No Rekening".toUpperCase(),
          data.rekening,
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
        BodyItemWidget(
          "Alamat".toUpperCase(),
          data.alamat,
          null,
          _margin,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

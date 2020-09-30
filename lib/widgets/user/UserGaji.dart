import 'package:baru_nih/models/application/data_gaji.dart';
import 'package:baru_nih/models/application/user_info.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:baru_nih/widgets/user/BodyItemCurrency.dart';

class UserGajiWidget extends StatelessWidget {
  final DataGaji data;

  UserGajiWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyDimensions.kContainerPadding,
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: MyColors.grey200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0))),
                  child: ListTile(
                    title: Text(
                      data.gaji.ketgaji.toUpperCase(),
                      style: TextStyle(color: MyColors.appPrimaryText),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                  child: _buildBodyCard(context, data.gaji),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
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
                  child: _buildDataGajiDetails(context, data.gaji),
                ),
              ],
            ),
          ),
          // isBottomCard ? _buildBottomCard(data) : Container(),
        ],
      ),
    );
  }

  Widget _buildBodyCard(BuildContext context, UserInfo data) {
    var _margin = EdgeInsets.only(top: 4, bottom: 4, right: 4);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        BodyItemCurrencyWidget(
          "No Gaji".toUpperCase(),
          data.nogaji,
          Colors.orange.shade800,
          _margin,
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Gaji sebelum potongan Pinjaman".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(color: MyColors.appPrimaryText),
              ),
            ),
          ],
        ),
        Divider(thickness: 1),
        SizedBox(height: 5),
        _buildDataGaji(data),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDataGaji(UserInfo data) {
    return Container(
      margin: EdgeInsets.only(top: 6.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "Rp " +
                  MyTextFormat.toCurrency(
                    ((double.parse(data.gapok) +
                        double.parse(data.tistri) +
                        double.parse(data.tanak) +
                        double.parse(data.tumum) +
                        double.parse(data.tstruktur) +
                        double.parse(data.tfungsi) +
                        double.parse(data.tpapua) +
                        double.parse(data.tpencil) +
                        double.parse(data.bulat) +
                        double.parse(data.tberas) +
                        double.parse(data.tlauk) +
                        double.parse(data.tpajak) +
                        double.parse(data.tbatas) +
                        double.parse(data.tbrevet) +
                        double.parse(data.tsandi) +
                        double.parse(data.tbabin) +
                        double.parse(data.tpolwan) +
                        double.parse(data.tkhusus)) -
                        (double.parse(data.iwp) +
                            double.parse(data.pph) +
                            double.parse(data.potberas) +
                            double.parse(data.sewarmh) +
                            double.parse(data.kembali) +
                            double.parse(data.utang) +
                            double.parse(data.potlain) +
                            double.parse(data.bpjs) +
                            double.parse(data.tgr)))
                        .toString(),
                  ),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: MyColors.appPrimaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataGajiDetails(BuildContext context, UserInfo data) {
    var _margin = EdgeInsets.only(top: 4, bottom: 4, right: 4);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize:  MainAxisSize.max,
      children: <Widget>[
         Expanded(
           flex: 5,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               BodyItemCurrencyWidget(
                 "gaji pokok".toUpperCase(),
                 MyTextFormat.toCurrency(data.gapok),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan istri/suami".toUpperCase(),
                 MyTextFormat.toCurrency(data.tistri),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan anak".toUpperCase(),
                 MyTextFormat.toCurrency(data.tanak),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan umum".toUpperCase(),
                 MyTextFormat.toCurrency(data.tumum),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan struktur".toUpperCase(),
                 MyTextFormat.toCurrency(data.tstruktur),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan fungsi".toUpperCase(),
                 MyTextFormat.toCurrency(data.tfungsi),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan papua".toUpperCase(),
                 MyTextFormat.toCurrency(data.tpapua),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan terpencil".toUpperCase(),
                 MyTextFormat.toCurrency(data.tpencil),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan bulat".toUpperCase(),
                 MyTextFormat.toCurrency(data.bulat),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan beras".toUpperCase(),
                 MyTextFormat.toCurrency(data.tberas),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan lauk".toUpperCase(),
                 MyTextFormat.toCurrency(data.tlauk),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan pajak".toUpperCase(),
                 MyTextFormat.toCurrency(data.tpajak),
                 null,
                 _margin,
               ),
               BodyItemCurrencyWidget(
                 "tunjangan batas".toUpperCase(),
                 MyTextFormat.toCurrency(data.tbatas),
                 null,
                 _margin,
               ),

             ],
           ),
         ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BodyItemCurrencyWidget(
                "tunjangan brevet".toUpperCase(),
                MyTextFormat.toCurrency(data.tbrevet),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "tunjangan sandi".toUpperCase(),
                MyTextFormat.toCurrency(data.tsandi),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "tunjangan babin".toUpperCase(),
                MyTextFormat.toCurrency(data.tbabin),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "tunjangan polwan".toUpperCase(),
                MyTextFormat.toCurrency(data.tpolwan),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "tunjangan khusus".toUpperCase(),
                MyTextFormat.toCurrency(data.tkhusus),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "potongan beras".toUpperCase(),
                "- " + MyTextFormat.toCurrency(data.potberas),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "iwp".toUpperCase(),
                "- " + MyTextFormat.toCurrency(data.iwp),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "pph".toUpperCase(),
                "- " + MyTextFormat.toCurrency(data.pph),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "sewa rumah".toUpperCase(),
                "- " + MyTextFormat.toCurrency(data.sewarmh),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "potongan kembali".toUpperCase(),
                "- " + MyTextFormat.toCurrency(data.kembali),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "potongan utang".toUpperCase(),
                "- " + MyTextFormat.toCurrency(data.utang),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "potongan lain".toUpperCase(),
                "- " + MyTextFormat.toCurrency(data.potlain),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "potongan tgr".toUpperCase(),
                "- " + MyTextFormat.toCurrency(data.tgr),
                null,
                _margin,
              ),
              BodyItemCurrencyWidget(
                "potongan bpjs".toUpperCase(),
                "- " + MyTextFormat.toCurrency(data.bpjs),
                null,
                _margin,
              ),
            ],
          ),
        ),
      ],
    );
  }

// Widget _buildBodyItem(
//     BuildContext context, String title, String subTitle, Color valueColor) {
//   return Container(
//     margin: EdgeInsets.symmetric(vertical: 4),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Expanded(
//           flex: 4, // of 100%
//           child: Container(
//             child: Text(
//               title,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 13,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 6, // of 100%
//           child: Container(
//               child: Text(
//             subTitle,
//             style: TextStyle(color: valueColor ?? MyColors.appPrimaryText),
//             maxLines: 4,
//             overflow: TextOverflow.ellipsis,
//           )),
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildBodyItemGaji(
//     BuildContext context, String title, String subTitle, Color valueColor) {
//   return Container(
//     margin: EdgeInsets.only(top: 4, bottom: 4, right: 4),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Expanded(
//           flex: 6, // of 100%
//           child: Container(
//             child: Text(
//               title,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 13,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 4, // of 100%
//           child: Container(
//               child: Text(
//             subTitle,
//             textAlign: TextAlign.right,
//             style: TextStyle(color: valueColor ?? MyColors.appPrimaryText),
//             maxLines: 4,
//             overflow: TextOverflow.ellipsis,
//           )),
//         ),
//       ],
//     ),
//   );
// }
}

import 'package:baru_nih/models/application/tunkin.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:baru_nih/widgets/user/BodyItemCurrency.dart';

class UserTunkinWidget extends StatelessWidget {
  final Tunkin data;

  UserTunkinWidget({
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
                      "Tunkin ".toUpperCase() +
                          MyDateFormat.convertDateFromStringHuman(
                                  data.tahunbulan)
                              .toUpperCase(),
                      style: TextStyle(color: MyColors.appPrimaryText),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                  child: _buildBodyCard(context, data),
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
                      "Details ".toUpperCase(),
                      style: TextStyle(color: MyColors.appPrimaryText),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
                  child: _buildDataTunkinDetails(context),
                ),
                data.potongan.length > 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          horizontalLine(context),
                          Text(
                            "Detail potongan".toUpperCase(),
                            style: TextStyle(color: MyColors.appPrimaryText),
                          ),
                          horizontalLine(context),
                        ],
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: _buildDetailPotongan(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget horizontalLine(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: MediaQuery.of(context).size.width > SCREEN_SIZE_320
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width * 0.15,
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  Widget _buildBodyCard(BuildContext context, Tunkin data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: _buildDataTunkin(),
        ),
      ],
    );
  }

  Widget _buildDataTunkin() {
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
                    ((double.parse(data.nilaitunkin)) -
                            (double.parse(data.potongantunkin)))
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

  Widget _buildDataTunkinDetails(BuildContext context) {
    var _margin = EdgeInsets.only(top: 4, bottom: 4, right: 4);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BodyItemCurrencyWidget(
          "kelas jabatan".toUpperCase(),
          data.klasjabatan ?? "",
          null,
          _margin,
        ),
        BodyItemCurrencyWidget(
          "nilai tunkin".toUpperCase(),
          MyTextFormat.toCurrency(data.nilaitunkin),
          null,
          _margin,
        ),
        BodyItemCurrencyWidget(
          "potongan tunkin".toUpperCase(),
          MyTextFormat.toCurrency(data.potongantunkin),
          null,
          _margin,
        ),
        BodyItemCurrencyWidget(
          "% potongan".toUpperCase(),
          MyTextFormat.toCurrency(data.persenpotongan) + " %",
          null,
          _margin,
        ),
      ],
    );
  }

  Widget _buildDetailPotongan(BuildContext context) {
    var _margin = EdgeInsets.only(top: 4, bottom: 4, right: 4);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.potongan.length,
      itemBuilder: (context, i) {
        var potongan = data.potongan[i];
        return BodyItemCurrencyWidget(
          potongan.namapotongan.toUpperCase(),
          MyTextFormat.toCurrency(potongan.totalrupiah),
          null,
          _margin,
        );
      },
    );
  }
}

import 'package:baru_nih/utils/my_import.dart';

class SendNotificationPage extends StatefulWidget {
  @override
  _SendNotificationPageState createState() => _SendNotificationPageState();
}

class _SendNotificationPageState extends State<SendNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundApp,
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        leading: BackButton(color: MyColors.black),
        title: Text(allTranslations.text("send_notification"),
            style: TextStyle(color: MyColors.black)),
        backgroundColor: MyColors.toolBarApp,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}

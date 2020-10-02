import 'package:baru_nih/models/popmenu.dart';
import 'package:baru_nih/models/application/user_info.dart';
import 'package:baru_nih/utils/my_import.dart';
import 'package:baru_nih/utils/routes.dart';
import 'package:baru_nih/widgets/appbar/popup_menu_widget.dart';
import 'package:baru_nih/widgets/cards/easyBadgeCard.dart';

import 'package:baru_nih/widgets/diagonally_cut_colored_image.dart';
import 'package:baru_nih/pages/change-languages/language_selector_icon_button.dart';
import 'package:baru_nih/widgets/cards/easyCard.dart';
import 'package:baru_nih/widgets/errors/loaddata_error.dart';
import 'package:baru_nih/widgets/images/no_data_widget.dart';
import 'package:baru_nih/widgets/list-tiles/listTilesIcon.dart';
import 'package:baru_nih/providers/auth_provider.dart';
import 'package:baru_nih/widgets/loaders/custom_circular_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';
import './blocs/index.dart';

class AccountPage extends StatefulWidget {
  final VoidCallback onSignedOut;

  AccountPage({Key key, this.onSignedOut}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}

List<PopupMenuModel> choices = <PopupMenuModel>[
  PopupMenuModel(
    id: 'token',
    title: 'Token',
    icon: Icons.settings_cell,
  ),
  PopupMenuModel(
    id: 'send',
    title: 'Send Notification',
    icon: Icons.send,
  ),
  PopupMenuModel(
    id: 'logout',
    title: 'Force LogOut',
    icon: Icons.power_settings_new,
  ),
];

class _AccountPageState extends State<AccountPage> {
  AuthStatus authStatus = AuthStatus.notDetermined;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AccountBloc _bloc = AccountBloc();

  bool isLoading = false;
  PackageInfo packageInfo;

  PopupMenuModel _selectedChoices = choices[0];

  void _select(PopupMenuModel choice) {
    _selectedChoices = choice;
    print("_selectedChoices: " + _selectedChoices.id);

    var auth = AuthProvider.of(context).auth;
    if (_selectedChoices.id == 'token') {
      var token = "";
      auth.getToken().then((res) {
        token = res;
        print("Token: =========================");
        MyTextFormat.logPrint(token);
        print("================================");
      });
    } else if (_selectedChoices.id == 'logout') {
      _forceLogout();
    } else if (_selectedChoices.id == 'send') {
      Navigator.of(context).pushNamed(SEND_NOTIFICATION_SCREEN);
    }
  }

  _AccountPageState() {
    _bloc.dispatch(AccountFetch());
    getPackageInfo();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  void getPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: MyColors.backgroundApp,
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        title: Text(allTranslations.text("tab_account_title"),
            style: TextStyle(color: MyColors.black)),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          LanguageSelectorIconButton(),
          // _buildPopMenuDev(),
          APP_DEV ? _buildPopMenuDev() : Container(),
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            isLoading
                ? Loader()
                : BlocBuilder(
                    bloc: _bloc,
                    builder: (BuildContext context, AccountBlocState state) {
                      if (state is AccountUninitialized) {
                        return CustomCircularProgressIndicator();
                      }
                      if (state is AccountDataError) {
                        return LoadDataError(
                          title: allTranslations.text("problem_occurred"),
                          subtitle:
                              allTranslations.text("something_went_wrong"),
                          bgColor: MyColors.menuDeals,
                        );
                      }
                      if (state is AccountDataLoaded) {
                        if (state.dataList.nrp == null) {
                          return NoDataWidget(
                            title: allTranslations.text("no_data"),
                            subTitle: allTranslations.text("no_data_found"),
                          );
                        }
                        return _buildBody(context, state.dataList);
                      }
                      return CustomCircularProgressIndicator();
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, data) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context, data),
            Padding(
              padding: MyDimensions.kContainerPadding,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                heightFactor: 0.9,
                child: Column(
                  children: <Widget>[
                    Card(child: _buildBodyView(data)),
                  ],
                ),
              ),
            ),
            SizedBox(height: MyDimensions.kPaddingx8),
            Container(child: _buildMenu()),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        APP_NAME + " " + SECONDARY_APP_NAME + " v",
                        style: TextStyle(
                          color: MyColors.appPrimaryText,
                          fontSize: 11.0,
                        ),
                      ),
                      Text(
                        packageInfo.version,
                        style: TextStyle(
                          color: MyColors.appPrimaryText,
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenu() {
    return Container(
      child: Padding(
        padding: MyDimensions.kContainerPadding,
        child: Column(
          children: <Widget>[
            EasyCard(
              prefixBadge: null,
              icon: Icons.info_outline,
              iconColor: MyColors.appPrimaryText2,
              title: allTranslations.text("changes_log"),
              description: allTranslations.text("changes_log_description"),
              suffixIcon: Icons.chevron_right,
              suffixIconColor: MyColors.appPrimaryText,
              onTap: _goChangesLog,
            ),
            EasyCard(
              prefixBadge: null,
              icon: Icons.lock_open,
              iconColor: MyColors.appPrimaryText2,
              title: allTranslations.text("change_password"),
              description: allTranslations.text("change_password_subtitle"),
              suffixIcon: Icons.chevron_right,
              suffixIconColor: MyColors.appPrimaryText,
              onTap: _goChangePassword,
            ),
            SizedBox(height: 4),
            EasyBadgeCard(
              title: allTranslations.text("logout"),
              description: allTranslations.text("logout_subtitle"),
              rightBadge: Colors.teal[400],
              suffixIcon: Icons.power_settings_new,
              suffixIconColor: MyColors.white,
              onTap: _goLogout,
            ),
            //============================== CLOSE HERE =========================
          ],
        ),
      ),
    );
  }

  Widget _buildDiagonalImageBackground(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return DiagonallyCutColoredImage(
      Image.asset(
        BACKGROUND_PROFILE,
        width: screenWidth,
        height: 180.0,
        fit: BoxFit.cover,
      ),
      color: const Color(0x22FA6F1E),
    );
  }

  Widget _buildCardProfile(UserInfo data) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyView(UserInfo data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Column(
            children: <Widget>[
              ListTilesIconWidget(
                iconData: Icons.verified_user,
                iconColor: Colors.green,
                title: "NRP/NIP".toUpperCase(),
                subTitle: data.nrp,
                border: true,
              ),
              ListTilesIconWidget(
                iconData: Icons.home,
                iconColor: Colors.blue,
                title: "SATKER",
                subTitle: data.satker.nmsatker,
                border: true,
              ),
              ListTilesIconWidget(
                iconData: Icons.location_on,
                iconColor: Colors.deepOrangeAccent,
                title: "POLDA",
                subTitle: data.satker.polda.nmuappaw,
                border: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, UserInfo data) {
    return Stack(
      children: <Widget>[
        _buildDiagonalImageBackground(context),
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.2,
          child: Column(
            children: <Widget>[
              // _buildAvatar(data),
              // _buildUserInfo(data),
              _buildCardProfile(data),
              // SizedBox(height: MyDimensions.kPaddingx16),
            ],
          ),
        ),
        //  Positioned(
        //   top: 26.0,
        //   left: 4.0,
        //   child:  BackButton(color: Colors.white),
        // ),
      ],
    );
  }

  Widget _buildPopMenuDev() {
    return PopupMenuButton<PopupMenuModel>(
      icon: Icon(
        Icons.more_vert,
        color: MyColors.appPrimaryText,
      ),
      onSelected: _select,
      itemBuilder: (BuildContext context) {
        return choices.map((PopupMenuModel choice) {
          return PopupMenuItem<PopupMenuModel>(
            value: choice,
            child: PopUPMenuWidget(choice),
          );
        }).toList();
      },
    );
  }

  void _showLoading() {
    setState(() => isLoading = true);
  }

  void _dismissLoading() {
    setState(() => isLoading = false);
  }

  Future<void> _goLogout() async {
    try {
      _showLoading();
      var auth = AuthProvider.of(context).auth;
      await auth.giveDelay(1000);
      await auth.signOut();
      _dismissLoading();
      print("LOGOUT");
      widget.onSignedOut();
    } catch (err) {
      print(err);
      _dismissLoading();
    }
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

  void _goChangePassword() {
    print("_goChangePassword");
    Navigator.of(context).pushNamed(CHANGE_PASSWORD_SCREEN);
  }

  void _goChangesLog() {
    print("_goChangesLog");
    Navigator.of(context).pushNamed(CHANGES_LOG_SCREEN);
  }

  // void _goPrivacy() {
  //   print("_goPrivacy");
  // }

  // void _goTerms() {
  //   print("_goTerms");
  // }
}

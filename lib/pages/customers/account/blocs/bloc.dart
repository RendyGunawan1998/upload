import 'dart:async';
import 'package:baru_nih/models/application/user_info.dart';
import 'package:baru_nih/utils/constants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './index.dart';

class AccountBloc extends Bloc<AccountBlocEvent, AccountBlocState> {
  @override
  Stream<AccountBlocEvent> transform(Stream<AccountBlocEvent> events) {
    return (events as Observable<AccountBlocEvent>)
        .debounce(Duration(milliseconds: 000));
  }

  @override
  get initialState => AccountUninitialized();

  @override
  Stream<AccountBlocState> mapEventToState(currentState, event) async* {
    if (event is AccountFetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is AccountUninitialized) {
          final dataList = await _fetchUserData();
          yield AccountDataLoaded(dataList: dataList, hasReachedMax: false);
        }
        if (currentState is AccountDataLoaded) {
          final dataList = await _fetchUserData();
          yield dataList.nrp == null
              ? currentState.copyWith(hasReachedMax: true)
              : AccountDataLoaded(
                  dataList: currentState.dataList,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield AccountDataError();
      }
    }
  }

  bool _hasReachedMax(AccountBlocState state) =>
      state is AccountDataLoaded && state.hasReachedMax;

  Future<UserInfo> _fetchUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences.getString(APP_USERDATA_KEY);
    // print(user);
    return fromJson(user);
  }
}

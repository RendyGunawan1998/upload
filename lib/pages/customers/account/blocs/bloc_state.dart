import 'package:baru_nih/models/application/errors.dart';
import 'package:equatable/equatable.dart';
import 'package:baru_nih/models/application/user_info.dart';

abstract class AccountBlocState extends Equatable {
  AccountBlocState([List props = const []]) : super(props);
}

class AccountUninitialized extends AccountBlocState {
  @override
  String toString() => 'AccountUninitialized';
}

class AccountDataError extends AccountBlocState {
  final ErrorModel dataError;

  AccountDataError({this.dataError}) : super([dataError]);

  AccountDataError copyWith({ErrorModel dataError}) {
    return AccountDataError(dataError: dataError ?? this.dataError);
  }

  @override
  String toString() => 'AccountDataError { code: ${dataError.code} }';
}

class AccountDataLoaded extends AccountBlocState {
  final UserInfo dataList;
  final bool hasReachedMax;

  AccountDataLoaded({
    this.dataList,
    this.hasReachedMax,
  }) : super([dataList, hasReachedMax]);

  AccountDataLoaded copyWith({
    UserInfo dataList,
    bool hasReachedMax,
    int nextPage,
  }) {
    return AccountDataLoaded(
      dataList: dataList ?? this.dataList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'AccountDataLoaded { data: ${dataList.nmpeg}, hasReachedMax: $hasReachedMax }';
}

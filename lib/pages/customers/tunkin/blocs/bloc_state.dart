import 'package:baru_nih/models/application/errors.dart';
import 'package:equatable/equatable.dart';
import 'package:baru_nih/models/application/tunkin.dart';

abstract class TunkinBlocState extends Equatable {
  TunkinBlocState([List props = const []]) : super(props);
}

class TunkinUninitialized extends TunkinBlocState {
  @override
  String toString() => 'TunkinUninitialized';
}

class TunkinDataError extends TunkinBlocState {
  final ErrorModel dataError;

  TunkinDataError({this.dataError}) : super([dataError]);

  TunkinDataError copyWith({ErrorModel dataError}) {
    return TunkinDataError(dataError: dataError ?? this.dataError);
  }

  @override
  String toString() => 'TunkinDataError { code: ${dataError.code} }';
}

class TunkinDataLoaded extends TunkinBlocState {
  final Tunkin dataList;
  final bool hasReachedMax;
  final int nextPage;

  TunkinDataLoaded({
    this.dataList,
    this.hasReachedMax,
    this.nextPage,
  }) : super([dataList, hasReachedMax, nextPage]);

  TunkinDataLoaded copyWith({
    Tunkin dataList,
    bool hasReachedMax,
    int nextPage,
  }) {
    return TunkinDataLoaded(
      dataList: dataList ?? this.dataList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      nextPage: nextPage ?? this.nextPage,
    );
  }

  @override
  String toString() =>
      'TunkinDataLoaded { data: ${dataList.nrp}, hasReachedMax: $hasReachedMax, nextPage: $nextPage }';
}

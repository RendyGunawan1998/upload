import 'package:equatable/equatable.dart';
import 'package:baru_nih/models/application/errors.dart';
import 'package:baru_nih/models/application/data_gaji.dart';


abstract class HomeBlocState extends Equatable{
  HomeBlocState([List props = const []]) : super();
}

class HomeUninitialized extends HomeBlocState{
  @override
  String toString() => 'HomeUninitialized';
}

class HomeDataError extends HomeBlocState {
  final ErrorModel dataError;

  HomeDataError({this.dataError}) : super([dataError]);

  HomeDataError copyWith({ErrorModel dataError}) {
    return HomeDataError(dataError: dataError ?? this.dataError);
  }

  @override
  String toString() => 'HomeDataError { code: ${dataError.code} }';
}

class HomeDataLoaded extends HomeBlocState {
  final DataGaji dataList;
  final bool hasReachedMax;
  final int nextPage;

  HomeDataLoaded({
    this.dataList,
    this.hasReachedMax,
    this.nextPage,
  }) : super([dataList, hasReachedMax, nextPage]);

  HomeDataLoaded copyWith({
    DataGaji dataList,
    bool hasReachedMax,
    int nextPage,
  }) {
    return HomeDataLoaded(
      dataList: dataList ?? this.dataList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      nextPage: nextPage ?? this.nextPage,
    );
  }

  @override
  String toString() =>
      'HomeDataLoaded { data: ${dataList.gaji.nogaji}, hasReachedMax: $hasReachedMax, nextPage: $nextPage }';
}


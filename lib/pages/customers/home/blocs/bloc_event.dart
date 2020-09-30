import 'package:equatable/equatable.dart';
import 'package:baru_nih/utils/my_import.dart';

abstract class HomeBlocEvent extends Equatable {}

class HomeFetch extends HomeBlocEvent {
  String bulanTahun;
  HomeFetch({@required this.bulanTahun});
  @override
  String toString() => 'Fetch';
}

class HomeUpdate extends HomeBlocEvent {
  String bulanTahun;
  HomeUpdate({@required this.bulanTahun});
  @override
  String toString() => 'Update';
}

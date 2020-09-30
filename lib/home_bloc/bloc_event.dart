import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


abstract class HomeBlocEvent extends Equatable{}

class HomeGetData extends HomeBlocEvent{
  String bulanTahun;
  HomeGetData({@required this.bulanTahun});
  @override
  String toString() => 'Fetch';
}

//*********************Update Here ***************
class HomeUpdate extends HomeBlocEvent{
  String bulanTahun;
  HomeUpdate({@required this.bulanTahun});
  @override
  String toString()=> 'Update';
}

import 'package:equatable/equatable.dart';

abstract class AccountBlocEvent extends Equatable {}

class AccountFetch extends AccountBlocEvent {
  @override
  String toString() => 'AccountFetch';
}

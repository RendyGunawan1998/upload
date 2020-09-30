import 'package:equatable/equatable.dart';

abstract class TunkinBlocEvent extends Equatable {}

class TunkinFetch extends TunkinBlocEvent {
  @override
  String toString() => 'Fetch';
}

class TunkinUpdate extends TunkinBlocEvent {
  @override
  String toString() => 'Update';
}

import 'package:baru_nih/resources/repository/order/order_api_provider.dart';

class OrderRepository {
  final orderApiProvider = OrderApiProvider();

  static final OrderRepository _instance = OrderRepository._internal();
  OrderRepository._internal();

  factory OrderRepository() {
    return _instance;
  }
}

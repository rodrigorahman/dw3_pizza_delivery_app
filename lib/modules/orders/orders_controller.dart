import 'package:dw3_pizza_delivery_app/models/user_model.dart';
import 'package:dw3_pizza_delivery_app/repositories/order_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersController extends GetxController with StateMixin {
  final OrderRepository _repository;
  UserModel _user;

  OrdersController(this._repository);

  @override
  Future<void> onInit() async {
    super.onInit();
    final sp = await SharedPreferences.getInstance();
    _user = UserModel.fromJson(sp.getString('user'));
    findOrders();
  }

  Future<void> findOrders() async {
    change([], status: RxStatus.loading());
    try {
      final orders = await _repository.findMyOrders(_user.id);
      change(orders, status: RxStatus.success());
    } catch (e) {
      change('Erro ao buscar pedidos', status: RxStatus.error());
    }
  }
}

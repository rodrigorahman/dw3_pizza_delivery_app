import 'package:dw3_pizza_delivery_app/modules/orders/orders_controller.dart';
import 'package:dw3_pizza_delivery_app/repositories/order_repository.dart';
import 'package:get/get.dart';

class OrdersBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderRepository(Get.find()));
    Get.put(OrdersController(Get.find()));
  }
}

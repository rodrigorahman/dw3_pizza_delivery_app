import 'package:dw3_pizza_delivery_app/modules/login/login_controller.dart';
import 'package:dw3_pizza_delivery_app/repositories/user_repository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(LoginController(Get.find()));
  }
}

import 'package:dw3_pizza_delivery_app/modules/register/register_controller.dart';
import 'package:dw3_pizza_delivery_app/repositories/user_repository.dart';
import 'package:get/get.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(Get.find()));
    Get.put(RegisterController(Get.find()));
  }
}

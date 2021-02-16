import 'package:dw3_pizza_delivery_app/modules/menu/menu_controller.dart';
import 'package:dw3_pizza_delivery_app/modules/menu/menu_page.dart';
import 'package:dw3_pizza_delivery_app/repositories/menu_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeController extends GetxController {
  var name = 'RodrigoAlmeida'.obs;
  
  Future<void> openMenu(String pizzaSize) async {
    Get.put(MenuRepository(Get.find()));
    Get.put(MenuController(Get.find()));
    await showBarModalBottomSheet(
      context: Get.context,
      builder: (context) {
        return MenuPage(pizzaSize);
      },
    );
    Get.delete<MenuController>();
    Get.delete<MenuRepository>();
  }
}

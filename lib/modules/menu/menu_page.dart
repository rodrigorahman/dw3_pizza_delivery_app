import 'package:dw3_pizza_delivery_app/modules/menu/widgets/menu_buy_button.dart';
import 'package:dw3_pizza_delivery_app/modules/menu/widgets/menu_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  final String pizzaSize;

  MenuPage(this.pizzaSize);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.pizzaSize,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.grey[200],
              child: Obx(
                () => Text(
                  'Total de pizzas selecionadas: ${controller.flavorsSelected.length}',
                  style: Get.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: MenuContent(),
            ),
            Container(
              child: MenuBuyButton(),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../menu_controller.dart';

class MenuBuyButton extends GetView<MenuController> {
  final formatter = NumberFormat('###.00', 'pt_br');
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Row(
        children: [
          SizedBox(
            width: Get.mediaQuery.size.width * .5,
            child: Obx(
              () => Text(
                'Total R\$ ${formatter.format(controller.totalValue)}',
                style: TextStyle(
                  fontSize: 18,
                  color: controller.flavorsSelected.isEmpty ? Colors.grey : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    controller.flavorsSelected.isEmpty ? Colors.grey[200] : Colors.red,
                  ),
                ),
                onPressed: () => controller.goToShoppingCard(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Fechar Pedido',
                    style: TextStyle(
                      fontSize: 18,
                      color: controller.flavorsSelected.isEmpty ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

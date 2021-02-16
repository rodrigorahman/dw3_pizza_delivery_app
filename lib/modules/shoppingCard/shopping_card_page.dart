import 'package:dw3_pizza_delivery_app/components/pizza_delivery_button.dart';
import 'package:dw3_pizza_delivery_app/modules/shoppingCard/shopping_card_controller.dart';
import 'package:dw3_pizza_delivery_app/modules/shoppingCard/widgets/shopping_card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sacola', style: TextStyle(color: Colors.black)),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Get.back(),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constructor) {
            
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constructor.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Nome'),
                        subtitle: Text(controller.userName),
                      ),
                      Divider(),
                      ShoppingCardItems(),
                      Divider(),
                      ListTile(
                        title: Text('Endereço de Entrega'),
                        subtitle: Obx(() => Text(controller.address)),
                        trailing: TextButton(
                          onPressed: () => controller.changeAddress(),
                          child: Text(
                            'alterar',
                            style: TextStyle(color: Get.theme.primaryColor),
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Forma de Pagamento'),
                        subtitle: Obx(() => Text(controller.paymentType)),
                        trailing: TextButton(
                          onPressed: () => controller.changePaymentType(),
                          child: Text(
                            'alterar',
                            style: TextStyle(color: Get.theme.primaryColor),
                          ),
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: SizedBox.shrink(),
                      ),
                      PizzaDeliveryButton(
                        label: 'Finalizar Pedido',
                        width: Get.mediaQuery.size.width * .9,
                        height: 50,
                        buttonColor: Get.theme.primaryColor,
                        labelSize: 18,
                        labelColor: Colors.white,
                        onPressed: () => controller.checkout(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

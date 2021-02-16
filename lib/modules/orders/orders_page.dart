import 'package:dw3_pizza_delivery_app/components/pizza_delivery_bottom_navigation.dart';
import 'package:dw3_pizza_delivery_app/models/order_model.dart';
import 'package:dw3_pizza_delivery_app/modules/orders/widgets/history_panel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'orders_controller.dart';

class OrdersPage extends GetView<OrdersController> {
  static const String ROUTE_PAGE = '/orders';
  static const int NAVIGATION_BAR_INDEX = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrdersPage'),
      ),
      bottomNavigationBar: PizzaDeliveryBottomNavigation(NAVIGATION_BAR_INDEX),
      body: LayoutBuilder(
        builder: (context, constructor) {
          return RefreshIndicator(
            onRefresh: () => controller.findOrders(),
            child: ListView(
              children: [
                SizedBox(
                  height: constructor.maxHeight,
                  child: controller.obx(
                    (state) => _makeOrder(state),
                    onError: (_) => Center(
                      child: Text('Erro ao buscar pedidos'),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Visibility _makeOrder(List<OrderModel> state) {
    return Visibility(
      visible: state.length > 0,
      replacement: Container(
        padding: EdgeInsets.all(8),
        child: Text(
          'Nenhum pedido',
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.length,
        itemBuilder: (context, index) {
          return HistoryPanel(state[index]);
        },
      ),
    );
  }
}

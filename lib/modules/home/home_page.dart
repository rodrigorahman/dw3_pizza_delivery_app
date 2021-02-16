import 'package:dw3_pizza_delivery_app/components/pizza_delivery_bottom_navigation.dart';
import 'package:dw3_pizza_delivery_app/modules/home/home_controller.dart';
import 'package:dw3_pizza_delivery_app/modules/home/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  static const String ROUTE_PAGE = '/home';
  static const int NAVIGATION_BAR_INDEX = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PizzaDeliveryBottomNavigation(NAVIGATION_BAR_INDEX),
      body: Column(
        children: [
          HomeHeader(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    'Pizzas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      onTap: () => controller.openMenu('Grande'),
                      title: Text(
                        'Grande',
                        style: TextStyle(fontSize: 16, color: Get.theme.accentColor),
                      ),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      onTap: () => controller.openMenu('Brotinho'),
                      title: Text(
                        'Brotinho',
                        style: TextStyle(fontSize: 16, color: Get.theme.accentColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

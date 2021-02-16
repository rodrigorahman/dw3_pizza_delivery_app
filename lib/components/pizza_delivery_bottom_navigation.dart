import 'package:dw3_pizza_delivery_app/modules/home/home_page.dart';
import 'package:dw3_pizza_delivery_app/modules/orders/orders_page.dart';
import 'package:dw3_pizza_delivery_app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PizzaDeliveryBottomNavigation extends StatelessWidget {
  final int _currentIndex;

  const PizzaDeliveryBottomNavigation(this._currentIndex, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Pedidos', icon: Icon(Icons.menu)),
        BottomNavigationBarItem(label: 'Sair', icon: Icon(FontAwesome.sign_out)),
      ],
      onTap: (index) async {
        switch (index) {
          case 0:
            Get.offNamed(HomePage.ROUTE_PAGE);
            break;
          case 1:
          Get.offNamed(OrdersPage.ROUTE_PAGE);
            break;
          case 2:
            final sp = await SharedPreferences.getInstance();
            sp.clear();
            Get.offAllNamed(SplashPage.ROUTE_PAGE);
            break;
          default:
        }
      },
    );
  }
}

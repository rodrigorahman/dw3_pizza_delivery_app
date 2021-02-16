import 'package:dw3_pizza_delivery_app/modules/home/home_binding.dart';
import 'package:dw3_pizza_delivery_app/modules/home/home_page.dart';
import 'package:dw3_pizza_delivery_app/modules/login/login_binding.dart';
import 'package:dw3_pizza_delivery_app/modules/login/login_page.dart';
import 'package:dw3_pizza_delivery_app/modules/orders/orders_bindings.dart';
import 'package:dw3_pizza_delivery_app/modules/orders/orders_page.dart';
import 'package:dw3_pizza_delivery_app/modules/register/register_bindings.dart';
import 'package:dw3_pizza_delivery_app/modules/register/register_page.dart';
import 'package:dw3_pizza_delivery_app/modules/splash/splash_bindings.dart';
import 'package:dw3_pizza_delivery_app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiConfig {
  UiConfig._();

  static final appTheme = ThemeData(
    primaryColor: Color(0XFF9D0000),
    primarySwatch: Colors.red,
  );

  static final routes = [
    GetPage(
      name: SplashPage.ROUTE_PAGE,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: HomePage.ROUTE_PAGE,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: LoginPage.ROUTE_PAGE,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RegisterPage.ROUTE_PAGE,
      page: () => RegisterPage(),
      binding: RegisterBindings(),
    ), 
    GetPage(
      name: OrdersPage.ROUTE_PAGE,
      page: () => OrdersPage(),
      binding: OrdersBindings(),
    ),
    
  ];
}

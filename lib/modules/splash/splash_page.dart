import 'package:dw3_pizza_delivery_app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashPage extends GetView<SplashController> {

  static const String ROUTE_PAGE = '/'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash'),
      ),
      body: Container(
        child: Obx(
          () => Text(
            controller.logged.toString(),
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}

import 'package:dw3_pizza_delivery_app/components/pizza_delivery_button.dart';
import 'package:dw3_pizza_delivery_app/components/pizza_delivery_input.dart';
import 'package:dw3_pizza_delivery_app/modules/login/login_controller.dart';
import 'package:dw3_pizza_delivery_app/modules/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  static const String ROUTE_PAGE = '/login';

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.mediaQuery.size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 250,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      PizzaDeliveryInput(
                        controller: emailEditingController,
                        label: 'E-mail',
                        validator: (String value) {
                          if (value == null || value.isBlank || !value.isEmail) {
                            return 'E-mail inválido';
                          }
                          return null;
                        },
                      ),
                      Obx(
                        () => PizzaDeliveryInput(
                          controller: passwordEditingController,
                          label: 'Senha',
                          suffixIcon: Icon(FontAwesome.key),
                          suffixIconOnPressed: controller.showHidePassword,
                          obscureText: controller.obscureText,
                          validator: (String value) {
                            if (value.length < 6) {
                              return 'Senha deve conter no mínimo 6 caracteres';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PizzaDeliveryButton(
                        label: 'Login',
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            controller.login(
                              emailEditingController.text,
                              passwordEditingController.text,
                            );
                          }
                        },
                        width: Get.mediaQuery.size.width * .8,
                        height: 50,
                        buttonColor: Get.theme.primaryColor,
                        labelSize: 20,
                        labelColor: Colors.white,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(RegisterPage.ROUTE_PAGE),
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

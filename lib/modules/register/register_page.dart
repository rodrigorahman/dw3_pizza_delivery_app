import 'package:dw3_pizza_delivery_app/components/pizza_delivery_button.dart';
import 'package:dw3_pizza_delivery_app/components/pizza_delivery_input.dart';
import 'package:dw3_pizza_delivery_app/modules/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  static const String ROUTE_PAGE = '/register';

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

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
                        controller: nameEditingController,
                        label: 'Nome',
                        validator: (String value) {
                          if (value == null || value.isBlank) {
                            return 'Nome obrigatório';
                          }
                          return null;
                        },
                      ),
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
                          obscureText: controller.obscureTextPassword,
                          validator: (String value) {
                            if (value.length < 6) {
                              return 'Senha deve conter no mínimo 6 caracteres';
                            }

                            return null;
                          },
                        ),
                      ),
                      Obx(
                        () => PizzaDeliveryInput(
                          controller: confirmPasswordEditingController,
                          label: 'Confirmar Senha',
                          suffixIcon: Icon(FontAwesome.key),
                          suffixIconOnPressed: controller.showHideConfirmPassword,
                          obscureText: controller.obscureTextConfirmPassword,
                          validator: (String value) {
                            if (value != passwordEditingController.text) {
                              return 'Senha e confirma senha diferentes';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PizzaDeliveryButton(
                        label: 'Salvar',
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            final name = nameEditingController.text;
                            final email = emailEditingController.text;
                            final password = passwordEditingController.text;
                            controller.registerUser(name, email, password);
                          }
                        },
                        width: Get.mediaQuery.size.width * .8,
                        height: 50,
                        buttonColor: Get.theme.primaryColor,
                        labelSize: 20,
                        labelColor: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PizzaDeliveryButton(
                        label: 'Voltar',
                        onPressed: () => Get.back(),
                        width: Get.mediaQuery.size.width * .8,
                        height: 50,
                        labelSize: 20,
                        labelColor: Colors.black,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocee/controllers/authentication.dart';
import 'package:ocee/ui/components/appbar.dart';
import 'package:ocee/ui/components/images.dart';
import 'package:ocee/ui/components/inputs.dart';
import 'package:ocee/ui/components/loader.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationController authenticationController =
        Get.find<AuthenticationController>();

    return Scaffold(
        appBar: appbar(title: "Ocee / Connexion"),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: MyImages.logo(scale: 1.5)),
                    SizedBox(height: 8),
                    Form(
                        child: Column(
                      children: [
                        MyInputs.formField(
                            label: "Email",
                            toUpdate: authenticationController.username),
                        SizedBox(
                          height: 8,
                        ),
                        MyInputs.formField(
                            label: "Password",
                            toUpdate: authenticationController.password,
                            obscure: true)
                      ],
                    )),
                    SizedBox(
                      height: 8,
                    ),
                    MyInputs.button(
                        text: "Se connecter",
                        onPress: () async {
                          await authenticationController.login();
                        })
                  ],
                ),
              ),
            ),
            Obx(() => authenticationController.loading.value
                ? Center(
                    child: Container(
                        width: Get.width, height: Get.height, child: loader()))
                : Container()),
          ],
        ));
  }
}

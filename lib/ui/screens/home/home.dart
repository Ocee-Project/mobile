import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocee/controllers/authentication.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationController authenticationController =
        Get.find<AuthenticationController>();

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/logo.png"),
        FutureBuilder(
          future: authenticationController.getHelloMessage(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data);
            } else {
              return Text("waiting");
            }
          },
        ),
        Obx(() => Text(authenticationController.num.value.toString())),
        RawMaterialButton(
          onPressed: () {
            authenticationController.increment();
          },
          child: Text("Increment"),
        ),
      ],
    )));
  }
}

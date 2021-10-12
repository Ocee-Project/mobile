import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocee/controllers/connectivity.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await Get.find<ConnectivityController>().initConnectivity();
      Get.toNamed("/login");
    });
    return Container();
  }
}

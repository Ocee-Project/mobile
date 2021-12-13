import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocee/controllers/connectivity.dart';

AppBar appbar({title, backButton = true}) {
  final ConnectivityController connectivityController =
      Get.find<ConnectivityController>();
  return AppBar(
    title: Text(title),
    automaticallyImplyLeading: backButton,
    actions: [
      IconButton(
          onPressed: () {
            Get.snackbar(
                "Internet",
                connectivityController.connectivityStrings[
                    connectivityController.currentConnectivity.value]);
          },
          tooltip: "État de la connexion à Internet",
          icon: Obx(() => connectivityIcon(
              connectivityController.currentConnectivity.value)))
    ],
  );
}

Icon connectivityIcon(ConnectivityResult connectivityResult) {
  switch (connectivityResult) {
    case ConnectivityResult.mobile:
      return const Icon(Icons.signal_cellular_4_bar);
    case ConnectivityResult.wifi:
      return const Icon(Icons.signal_wifi_4_bar);
    case ConnectivityResult.ethernet:
      return const Icon(Icons.signal_wifi_4_bar);
      break;
    case ConnectivityResult.none:
      return const Icon(Icons.signal_cellular_0_bar);
      break;
  }
}

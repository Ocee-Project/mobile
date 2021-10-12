import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  Rx<ConnectivityResult> currentConnectivity = ConnectivityResult.none.obs;

  Map<ConnectivityResult, String> connectivityStrings = {
    ConnectivityResult.wifi: "Vous êtes connectés en Wi-Fi",
    ConnectivityResult.ethernet: "Vous êtes connectés via Ethernet",
    ConnectivityResult.mobile: "Vous êtes connectés sur vos données mobiles",
    ConnectivityResult.none: "Vous n'êtes plus connectés à Internet"
  };

  Future<void> initConnectivity() async {
    // Listener
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      var value = await _connectivity.checkConnectivity();
      return _updateConnectionStatus(value);
    } on PlatformException {
      return;
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    currentConnectivity.value = result;
    Get.snackbar("Internet", connectivityStrings[result]);
  }

  bool connected() {
    return currentConnectivity.value != ConnectivityResult.none;
  }
}

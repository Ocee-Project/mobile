import 'package:get/instance_manager.dart';

class MyBindigs implements Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}

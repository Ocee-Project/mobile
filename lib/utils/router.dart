import 'package:get/route_manager.dart';
import 'package:ocee/ui/screens/home/home.dart';

class MyRouter {
  static var route = [
    GetPage(name: '/home', page: () => HomePage()),
  ];
}

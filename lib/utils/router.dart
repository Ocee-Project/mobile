import 'package:get/route_manager.dart';
import 'package:ocee/ui/screens/login/login.dart';

class MyRouter {
  static var route = [
    GetPage(name: '/login', page: () => LoginPage()),
  ];
}

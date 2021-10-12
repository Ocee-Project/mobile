import 'package:get/route_manager.dart';
import 'package:ocee/ui/screens/login/login.dart';
import 'package:ocee/ui/screens/projects/projects.dart';
import 'package:ocee/ui/screens/splash/splash.dart';

class MyRouter {
  static var route = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/projects', page: () => ProjectsPage()),
  ];
}

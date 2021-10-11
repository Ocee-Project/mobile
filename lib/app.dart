import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:ocee/bindings/bindings.dart';
import 'package:ocee/utils/router.dart';
import 'package:ocee/utils/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: GetMaterialApp(
          title: 'ocee',
          theme: Themes.lightV2,
          initialBinding: MyBindigs(),
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fadeIn,
          getPages: MyRouter.route,
          initialRoute: '/login',
        ));
  }
}

import "package:get/get.dart";

import '../controller/auth_controller.dart';
import '../controller/theme_controller.dart';


class InitialBindings implements Bindings{
  @override

  void dependencies (){

    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}


import 'package:appeducation/bindings/init_bindings.dart';
import 'package:appeducation/configs/themes/app_dark_theme.dart';
import 'package:appeducation/configs/themes/app_light_theme.dart';
import 'package:appeducation/controller/theme_controller.dart';
import 'package:appeducation/routes/app_routes.dart';
import 'package:appeducation/screens/introduction.dart';
import 'package:appeducation/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'data_upload_screen.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

// se inhibe la conexion a firebase mientras se crean las pantallas del proyecto

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home:DataUploadScreen()));
}*/

void main(){
  WidgetsFlutterBinding.ensureInitialized();
   InitialBindings().dependencies();
  runApp(MyApp());
}

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return GetMaterialApp(
        theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
      );
    }
}
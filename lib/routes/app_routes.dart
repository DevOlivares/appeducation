import 'package:appeducation/controller/question_paper/question_paper_controller.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/introduction.dart';
import '../screens/splash_screen.dart';
import '../services/firebase_storage_service.dart';

class AppRoutes {
  static List<GetPage> routes()=>[
    GetPage(name:"/", page:()=> const SplashScreen()),
    GetPage(name:"/introduction",
        page:()=> const AppIntroductionScreen()),
    GetPage(
        name: "/home",
        page:()=> const HomeScreen(),
        binding: BindingsBuilder((){
          Get.put(QuestionPaperController());
          Get.lazyPut(()=>FirebaseStorageService());
     //     Get.put(FirebaseStorageService());
          //   Get.put(MyZoomDrawerController());
        })),

    /*GetPage(name: LoginScreen.routeName,
        page: ()=>LoginScreen()
    )*/
  ];
}
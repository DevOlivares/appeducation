import 'package:appeducation/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_circle_button.dart';


class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.2 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, size: 65,),
                  SizedBox(height: 40),
                  const Text(
                      textAlign:TextAlign.center,
                    //  style: TextStyle(fontSize:18, color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                      'The is a Study App. You can use it as you want. If you understand you would able to scale it. If you understand how this works, you would be able scale it'),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      navigateToHome();
                    },
                    child: AppCircleButton(
                      child: const Icon(Icons.arrow_forward, size:35),
                 //   onTap:  ()=>
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
  void navigateToHome(){
  Get.offAllNamed("/home");
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pixels_admin/views/login_page/login_screen.dart';
import 'package:pixels_admin/views/widget/neumorphism_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splashNavigator(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphismCircleWidget(
                height: 240.h,
                padding: 0,
                widget: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 100,
                  backgroundImage:
                      AssetImage('assest/images/Splash screen....jpeg'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'assest/images/40751-loading-text.json',
                    height: 70,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> splashNavigator(context) async {
  await Future.delayed(const Duration(seconds: 5));
  Get.offAll(ScreenLogin());
}

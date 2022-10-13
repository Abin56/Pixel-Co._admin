// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixels_admin/firebase_options.dart';
import 'package:pixels_admin/views/login_page/login_screen.dart';
import 'package:pixels_admin/views/splash_screen/splash_screen.dart';

Future<void> main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(423.5294196844927, 925.0980565145541),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: "Pixcles",
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[300],
              ),
              scaffoldBackgroundColor: Colors.grey[300],
              primarySwatch: Colors.blue,
              textTheme: const TextTheme(
                bodyText1: TextStyle(color: Colors.black),
                bodyText2: TextStyle(color: Colors.black),
              ),
            ),
            home: const ScreenLogin(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

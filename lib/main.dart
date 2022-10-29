// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/controller/Bloc/Login_in/bloc_event.dart';
import 'package:pixels_admin/controller/Bloc/Login_in/bloc_state.dart';
import 'package:pixels_admin/firebase_options.dart';
import 'package:pixels_admin/views/drawer/drawer.dart';
import 'package:pixels_admin/views/splash_screen/splash_screen.dart';

import 'package:pixels_admin/views/widget/permission_gallery.dart';

import 'views/login_page/widget/sing_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  requestpermission();
  runApp(const MyApp());

  ScreenUtil.ensureScreenSize();
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
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: GetMaterialApp(
                title: "Pixcles",
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black,
                  ),
                  scaffoldBackgroundColor: Colors.black,
                  // primarySwatch: Colors.blue,
                  textTheme: TextTheme(
                    bodyText1: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                    bodyText2: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                // Checking for Admin login or not....................

                home: BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (oldState, newState) {
                    return oldState is AuthInitialState;
                  },
                  builder: (context, state) {
                    if (state is AuthLogInState) {
                      return DrawerWidget();
                    } else if (state is AuthLogOutState) {
                      return const ScreenSignIn();
                    } else {
                      return const SplashScreen();
                    }
                  },
                )),
          );
        });
  }
}

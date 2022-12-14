// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../drawer/drawer.dart';

class ScreenSignIn extends StatelessWidget {
  const ScreenSignIn({super.key});
  Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'User not Found') {
        log("No user found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: ListView(
            children: [
              SizedBox(
                height: 50.h,
              ),
              const Text(
                'SIGN IN',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40.h,
              ),
              const Text(
                'WELCOME BACK :)',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 11.h,
              ),
              const Text(
                'To Keep Connected with us please login with your Personal\n information by address and password',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "     Email ID*",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  const Text(
                    "     Password*",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [Text('  Forgot Password ?')],
                    ),
                  ),
                ],
              ),
              //<<<<<<<<<<<<<<<<<<<<<<<<<SIGN UP>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    log('Preseeddddddddddddd');
                    User? user = await loginUsingEmailPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                    log(user.toString());
                    if (user != null) {
                      Get.to(DrawerWidget());
                      log(FirebaseAuth
                          .instance.currentUser!.metadata.lastSignInTime
                          .toString());
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      primary: const Color.fromARGB(255, 3, 37, 171),
                      fixedSize: const Size(330, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              // SizedBox(
              //   height: 210.h,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       const Text(
              //         'Or you can join with',
              //         style: TextStyle(
              //             color: Colors.black, fontWeight: FontWeight.bold),
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           SignInButton.mini(
              //               buttonType: ButtonType.facebook, onPressed: () {}),
              //           SignInButton.mini(
              //             buttonType: ButtonType.google,
              //             onPressed: () {},
              //             elevation: 1,
              //           ),
              //           SignInButton.mini(
              //               buttonType: ButtonType.twitter, onPressed: () {}),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 25.h,
              //       ),
              //       RichText(
              //         text: TextSpan(
              //           text: "Don't have an Account? Click here ",
              //           style: TextStyle(color: Colors.black),
              //           children: [
              //             TextSpan(
              //                 onEnter: (event) => log('Wornds'),
              //                 text: 'Register Now',
              //                 style: TextStyle(
              //                     decoration: TextDecoration.underline,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.black))
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
  //Login Function>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

}

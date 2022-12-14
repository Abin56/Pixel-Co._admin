// ignore_for_file: file_names, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixels_admin/model/usermodel.dart';
import 'package:pixels_admin/views/color/color.dart';
import 'package:pixels_admin/views/widget/neumorphism_widget.dart';

class ScreenUserManagement extends StatelessWidget {
  const ScreenUserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Management",
          style: GoogleFonts.montserrat(
              color: backgroundColor,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('allUserData').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final data =
                    UserModel.fromJson(snapshot.data!.docs[index].data());
                return NeumorphismWidget(
                  blurRadius: 15,
                  color: kwhite,
                  height: 93.h,
                  padding: 20,
                  borderRadius: BorderRadius.circular(30),
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Image.network(data.photoUrl),
                      ),
                      Text(
                        data.name,
                        style: GoogleFonts.montserrat(
                            color: backgroundColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      MyCustomWidget()
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 24.h,
                );
              },
              itemCount: snapshot.data!.docs.length,
            );
          } else {
            return const Text('No More Data');
          }
        },
      )),
    );
  }
}

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with TickerProviderStateMixin {
  bool isChecked = false;
  final Duration _duration = const Duration(milliseconds: 370);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Center(
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(
                () {
                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                  isChecked = !isChecked;
                },
              );
            },
            child: Container(
              width: 77.w,
              height: 38.h,
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              decoration: BoxDecoration(
                color: isChecked ? Colors.green : Colors.red,
                borderRadius: const BorderRadius.all(
                  Radius.circular(99),
                ),
                boxShadow: [
                  BoxShadow(
                    color: isChecked
                        ? Colors.green.withOpacity(0.6)
                        : Colors.red.withOpacity(0.6),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: _animation.value,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (_animationController.isCompleted) {
                              _animationController.reverse();
                            } else {
                              _animationController.forward();
                            }
                            isChecked = !isChecked;
                          },
                        );
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

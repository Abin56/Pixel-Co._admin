import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pixels_admin/controller/getx/getx.dart';
import 'package:pixels_admin/views/chat/chat_screen.dart';
import 'package:pixels_admin/views/delivery_screen/delivery_screen.dart';
import 'package:pixels_admin/views/order_screen/orderlist_screen.dart';

final homeController = Get.put(Controllers());

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controllers>(
        init: homeController,
        builder: (_) {
          return Scaffold(
            body: screen[homeController.currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: GNav(
                  selectedIndex: homeController.currentIndex,
                  onTabChange: (value) {
                    homeController.currentindex(value);
                  },
                  tabBorderRadius: 30,
                  haptic: true,
                  backgroundColor: Colors.grey[300]!,
                  color: Colors.black,
                  activeColor: Colors.white,
                  tabBackgroundColor: Colors.grey.shade800,
                  gap: 8,
                  padding: EdgeInsets.all(16),
                  tabs: [
                    // GButton(
                    //   icon: Icons.home,
                    //   text: 'Home',
                    // ),
                    GButton(
                      icon: Icons.emoji_emotions_outlined,
                      text: 'Orders',
                    ),
                    GButton(
                      icon: Icons.chat,
                      text: 'Chat Hub',
                    ),
                    GButton(
                      icon: Icons.delivery_dining,
                      text: 'Delivery',
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

//List of screens
List screen = [
  // ScreenHome(),
  OrderListScreen(),
  ChatHubScreen(),
  DeliveryScreen(),
];

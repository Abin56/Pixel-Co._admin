import 'package:flutter/material.dart';
import 'package:pixels_admin/views/drawer/pages/admin/widget/desgin_container.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ContainerWidget(
                  index: index,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 25,
              );
            },
            itemCount: 7),
      ),
    );
  }
}

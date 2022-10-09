import 'package:flutter/material.dart';

import 'package:pixels_admin/views/widget/navigationbar.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  var icons1 = Icons.home;
  var icons2 = Icons.settings;
  var icons3 = Icons.favorite;
  var icons4 = Icons.message;

  bool buttonpressed1 = false;
  bool buttonpressed2 = false;
  bool buttonpressed3 = false;
  bool buttonpressed4 = false;
  void _lesspress1() {
    // Expanded(child: Samplescreenone());

    setState(() {
      buttonpressed1 = true;
      buttonpressed2 = false;
      buttonpressed3 = false;
      buttonpressed4 = false;
    });
  }

  void _lesspress2() {
    setState(() {
      buttonpressed1 = false;
      buttonpressed2 = true;
      buttonpressed3 = false;
      buttonpressed4 = false;
    });
  }

  void _lesspress3() {
    setState(() {
      buttonpressed1 = false;
      buttonpressed2 = false;
      buttonpressed3 = true;
      buttonpressed4 = false;
    });
  }

  void _lesspress4() {
    setState(() {
      buttonpressed1 = false;
      buttonpressed2 = false;
      buttonpressed3 = false;
      buttonpressed4 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: GestureDetector(
          onTap: _lesspress1,
          child: buttonpressed1
              ? ButtonTapped(icondata: icons1)
              : ButtonWidget(icondata: icons1),
        )),
        Expanded(
          child: GestureDetector(
            onTap: _lesspress2,
            child: buttonpressed2
                ? ButtonTapped(icondata: icons2)
                : ButtonWidget(icondata: icons2),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: _lesspress3,
            child: buttonpressed3
                ? ButtonTapped(icondata: icons3)
                : ButtonWidget(icondata: icons3),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: _lesspress4,
            child: buttonpressed4
                ? ButtonTapped(icondata: icons4)
                : ButtonWidget(icondata: icons4),
          ),
        ),
      ],
    );
  }
}

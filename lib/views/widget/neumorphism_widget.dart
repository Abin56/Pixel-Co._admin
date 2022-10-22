import 'package:flutter/material.dart';
import 'package:pixels_admin/views/color/color.dart';

class NeumorphismWidget extends StatelessWidget {
  double height;
  double padding;
  double blurRadius;
  Widget widget;
  var color;
  var borderRadius;
  // BoxShape? shape,
  NeumorphismWidget(
      {required this.height,
      required this.padding,
      required this.widget,
      required this.borderRadius,
      required this.color,
      required this.blurRadius,
      // required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        // width: width,
        // ignore: sort_child_properties_last
        child: widget,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 2, color: Colors.white.withOpacity(0.13)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.10),
              Colors.white.withOpacity(0.10)
            ],
          ),
        ),
      ),
    );
  }
}

class NeumorphismCircleWidget extends StatelessWidget {
  double height;
  double padding;
  Widget widget;
  var borderRadius;
  // BoxShape? shape,
  NeumorphismCircleWidget(
      {required this.height,
      required this.padding,
      required this.widget,
      // required this.borderRadius,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,

      // ignore: sort_child_properties_last
      child: widget,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: Colors.white.withOpacity(0.13)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.10),
            Colors.white.withOpacity(0.10)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
          borderRadius: borderRadius,
          color: Colors.grey[300],
          // borderRadius: BorderRadius.circular(12),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: color,
              offset: Offset(-4, -4),
              blurRadius: blurRadius,
              spreadRadius: 1,
            ),
          ],
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
        // borderRadius: borderRadius,
        color: Colors.grey[300],
        // borderRadius: BorderRadius.circular(12),
        shape: BoxShape.circle,

        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}

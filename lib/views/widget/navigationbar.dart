// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, sort_child_properties_last

import 'package:flutter/material.dart';

import '../color/color.dart';


class ButtonTapped extends StatelessWidget {

  // int? index;
  var icondata;
  ButtonTapped({required this.icondata, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Icon(
          icondata,
          size: 35,
          color: Colors.grey[700],
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
        boxShadow: [
          const BoxShadow(
              color: kwhite,
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: Colors.grey[600]!,
              offset: const Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[700]!,
            Colors.grey[600]!,
            Colors.grey[500]!,
            Colors.grey[200]!,
          ],
          stops: const [0, 0.1, 0.3, 1],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  var icondata;
  // int? index;
  ButtonWidget({required this.icondata, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Icon(
        icondata,
        size: 37,
        color: Colors.grey[800],
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
              color: Colors.grey[600]!,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
          const BoxShadow(
              color: kwhite,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[200]!,
            Colors.grey[300]!,
            Colors.grey[400]!,
            Colors.grey[500]!,
          ],
          stops: const [0.1, 0.3, 0.8, 1],
        ),
      ),
    );
  }
}

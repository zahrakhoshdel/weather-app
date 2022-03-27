// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomWeatherIcon extends StatelessWidget {
  String img;
  double width;
  CustomWeatherIcon({Key? key, required this.img, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(img),
      width: width,
      height: width,
      fit: BoxFit.fill,
    );
  }
}

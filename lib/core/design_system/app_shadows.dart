import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  static List<BoxShadow> card = [
    BoxShadow(
      color: Colors.black.withOpacity(.08),
      blurRadius: 20,
      offset: const Offset(0, 10),
    )
  ];
}

import 'package:flutter/material.dart';
import 'package:yasam_uygulamasi/const.dart';

class IconCinsiyyet extends StatelessWidget {
  final String? cinsiyyet;
  final IconData? icon;
  IconCinsiyyet({this.cinsiyyet, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.black54,
          size: 40,
        ),
        Text(
          cinsiyyet!,
          style: metinStili,
        ),
      ],
    );
  }
}
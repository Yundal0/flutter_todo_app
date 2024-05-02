// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';

class ContainerLayout extends StatelessWidget {
  Color color;
  Widget child;

  ContainerLayout({super.key, this.color = AppColor.neutral60, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        child: child);
  }
}

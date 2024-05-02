import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';

Future<void> bottomSheet({
  required BuildContext context,
  required Widget child,
  required double height
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColor.neutral80,
    barrierColor: Colors.black.withOpacity(0.75),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    isScrollControlled: true,
    isDismissible: false,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        padding: const EdgeInsets.all(2),
        child: child
      );
    },
  );
}

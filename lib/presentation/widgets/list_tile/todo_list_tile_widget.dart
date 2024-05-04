// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/config/app_gap.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';

class TodoListTile extends StatelessWidget {
  bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  String todoTitle;

  TodoListTile(
      {super.key,
      required this.taskCompleted,
      required this.todoTitle,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(4),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.blue,
            ),
            AppGap.size8,
            Expanded(
              // Expanded 추가
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todoTitle, style: AppTextStyle.bodyLarge()),
                  AppGap.size4,
                  const Divider(
                    thickness: 1,
                    height: 1,
                    color: AppColor.neutral60,
                  ),
                  AppGap.size2,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

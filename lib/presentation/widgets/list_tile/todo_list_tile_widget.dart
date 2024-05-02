// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/config/app_gap.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';

class TodoListTile extends StatelessWidget {
  String todoTitle;

  TodoListTile({super.key, required this.todoTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 6),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (p) {}),
          AppGap.size8,
          Expanded(
            // Expanded 추가
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todoTitle, style: AppTextStyle.bodyMedium()),
                AppGap.size2,
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
    );
  }
}

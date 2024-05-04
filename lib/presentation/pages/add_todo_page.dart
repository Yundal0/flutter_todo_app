// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';
import 'package:flutter_todo_app/app/utils/database.dart';
import 'package:flutter_todo_app/presentation/widgets/container_layout_widget.dart';

class AddTodoPage extends StatefulWidget {
  int folderIndex;

  AddTodoPage({super.key, required this.folderIndex});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  Database db = Database();
  int selectedColor = AppColor.primaryBlueHex;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  void createNewTodo() {
    if (controller.text.isNotEmpty) {
      db.createTodo(widget.folderIndex, controller.text);
      controller.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          //! bottom_sheet_app_bar_widget.dart
          Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('취소',
                      style: AppTextStyle.bodyLarge(AppColor.primaryBlue)),
                ),
                Text('새로운 할 일', style: AppTextStyle.titleLarge()),
                TextButton(
                  onPressed: controller.text.isNotEmpty ? createNewTodo : null,
                  child: Text('추가',
                      style: AppTextStyle.titleLarge(controller.text.isNotEmpty
                          ? AppColor.primaryBlue
                          : AppColor.neutral40)),
                ),
              ],
            ),
          ),

          //! insert_folder_name_widget.dart
          ContainerLayout(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.start,
              cursorColor: AppColor.primaryBlue,
              style: AppTextStyle.bodyLarge(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 8),
                hintText: '할 일',
                hintStyle: AppTextStyle.bodyLarge(AppColor.neutral30),
                // 기본 border를 UnderlineInputBorder로 설정하고 색상을 투명으로 설정하여 보이지 않게 합니다.
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                // 포커스 되지 않았을 때 밑줄이 보이도록 설정합니다.
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                // 포커스 됐을 때 밑줄이 보이도록 설정합니다.
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.neutral30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

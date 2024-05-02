// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/config/app_gap.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';
import 'package:flutter_todo_app/app/utils/database.dart';
import 'package:flutter_todo_app/presentation/widgets/layout/container_layout_widget.dart';

class AddFolderPage extends StatefulWidget {
  const AddFolderPage({super.key});

  @override
  State<AddFolderPage> createState() => _AddFolderPageState();
}

class _AddFolderPageState extends State<AddFolderPage> {
  int selectedColor = AppColor.primaryBlueHex;
  TextEditingController controller = TextEditingController();
  Database db = Database();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  void saveNewFolder() {
    if (controller.text.isNotEmpty) {
      db.addFolder(selectedColor, controller.text);
      controller.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<int> colors = [
      AppColor.secondaryRedHex,
      AppColor.secondaryOrangeHex,
      AppColor.secondaryYellowHex,
      AppColor.secondaryGreenHex,
      AppColor.primaryBlueHex,
      AppColor.secondaryIndigoHex,
      AppColor.secondaryPurpleHex
    ];

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
                Text('새로운 폴더', style: AppTextStyle.titleLarge()),
                TextButton(
                  onPressed: controller.text.isNotEmpty ? saveNewFolder : null,
                  child: Text('완료',
                      style: AppTextStyle.titleLarge(controller.text.isNotEmpty
                          ? AppColor.primaryBlue
                          : AppColor.neutral40)),
                ),
              ],
            ),
          ),

          //! insert_folder_name_widget.dart
          ContainerLayout(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Color(selectedColor),
                  radius: 40,
                  child: Icon(
                    Icons.list,
                    size: 56,
                    color: AppColor.neutral00,
                  ),
                ),
                AppGap.size12,
                TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  cursorColor: AppColor.primaryBlue,
                  style: AppTextStyle.headlineMedium(Color(selectedColor)),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    filled: true,
                    fillColor: AppColor.neutral40,
                    hintText: '폴더 이름',
                    hintStyle: AppTextStyle.headlineMedium(AppColor.neutral30),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),

          //! select_color_widget.dart
          ContainerLayout(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: colors.sublist(0, 6).map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: selectedColor == color
                                ? AppColor.neutral40
                                : Colors.transparent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(color),
                          radius: 20,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                AppGap.size12,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = colors.last; // purple
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: selectedColor == colors.last
                                ? AppColor.neutral40
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(colors.last),
                          radius: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

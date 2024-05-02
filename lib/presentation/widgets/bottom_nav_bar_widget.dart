import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/config/app_gap.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';
import 'package:flutter_todo_app/app/utils/bottom_sheet.dart';
import 'package:flutter_todo_app/presentation/pages/add_folder_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.add_box_rounded,
                  color: AppColor.primaryBlue,
                ),
                AppGap.size8,
                Text('새로운 할 일',
                    style: AppTextStyle.titleLarge(AppColor.primaryBlue)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              bottomSheet(context: context, child: const AddFolderPage(), height: MediaQuery.of(context).size.height * 0.9,);
            },
            child: Text('폴더 추가',
                style: AppTextStyle.bodyLarge(AppColor.primaryBlue)),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/config/app_gap.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';
import 'package:flutter_todo_app/presentation/pages/folder_detail_page.dart';

class FolderListTile extends StatelessWidget {
  int folderColor;
  String folderName;

  FolderListTile(
      {super.key, required this.folderColor, required this.folderName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FolderDetailsPage(
            folderName: folderName,
            folderColor: folderColor,
          ),
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColor.neutral80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(folderColor),
                  child: const Icon(Icons.list,
                      color: AppColor.neutral00, size: 24),
                ),
                AppGap.size8,
                Text(folderName, style: AppTextStyle.bodyLarge()),
              ],
            ),
            Row(
              children: [
                Text('0', style: AppTextStyle.bodyLarge(AppColor.neutral30)),
                AppGap.size8,
                const Icon(Icons.arrow_forward, color: AppColor.neutral30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

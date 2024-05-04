// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/config/app_gap.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';
import 'package:flutter_todo_app/app/utils/database.dart';
import 'package:flutter_todo_app/presentation/pages/completed_todo_page.dart';
import 'package:provider/provider.dart';

class DialogBox extends StatelessWidget {
  final int folderIndex;
  final String folderName;
  final int folderColor;

  const DialogBox(
      {super.key,
      required this.folderIndex,
      required this.folderName,
      required this.folderColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.neutral60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //! 목록 정보 보기
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // color: Colors.blue
                  ),
                  child: Row(
                    children: [
                      // 목록 정보 보기
                      Icon(
                        Icons.info,
                        color: AppColor.neutral00,
                      ),

                      AppGap.size8,

                      Text(
                        '목록 정보 보기',
                        style: AppTextStyle.bodyLarge(),
                      )
                    ],
                  ),
                ),
              ),

              //! 구분선
              Divider(thickness: 0.25, height: 0.25),

              //! 완료된 항목 보기
              GestureDetector(
                onTap: () {
                  // bottomSheet 창 닫기
                  Navigator.of(context).pop();
                  
                  // 완료된 항목 페이지로 이동
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CompletedTodoPage(
                      folderIndex: folderIndex,
                      folderName: folderName,
                      folderColor: folderColor,
                    ),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // 목록 정보 보기
                      Icon(
                        Icons.visibility,
                        color: AppColor.neutral00,
                      ),

                      AppGap.size8,

                      Text(
                        '완료된 항목 보기',
                        style: AppTextStyle.bodyLarge(),
                      )
                    ],
                  ),
                ),
              ),

              //! 구분선
              Divider(thickness: 0.25, height: 0.25),

              //! 목록 삭제
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                  Navigator.of(context).pop(); // 처음 화면으로 돌아가기
                  // 폴더 삭제 기능
                  Provider.of<Database>(context, listen: false)
                      .removeFolder(folderName);
                },
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // color: Colors.blue
                  ),
                  child: Row(
                    children: [
                      // 목록 정보 보기
                      Icon(
                        Icons.delete,
                        color: AppColor.secondaryRed,
                      ),

                      AppGap.size8,

                      Text(
                        '목록 삭제',
                        style: AppTextStyle.bodyLarge(AppColor.secondaryRed),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(12),
              padding: EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.neutral60),
              child: Center(
                  child: Text(
                '닫기',
                style: AppTextStyle.bodyLarge(),
              ))),
        ),
      ],
    );
  }
}

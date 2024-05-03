import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/config/app_gap.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';
import 'package:flutter_todo_app/app/utils/database.dart';
import 'package:flutter_todo_app/presentation/widgets/dialog_box_widget.dart';
import 'package:flutter_todo_app/presentation/widgets/list_tile/todo_list_tile_widget.dart';
import 'package:provider/provider.dart';

import '../../app/utils/bottom_sheet.dart';

class FolderDetailsPage extends StatefulWidget {
  final String folderName;
  final String todos;
  final int folderColor;

  FolderDetailsPage(
      {super.key,
      required this.folderName,
      required this.folderColor,
      required this.todos});

  @override
  State<FolderDetailsPage> createState() => _FolderDetailsPageState();
}

class _FolderDetailsPageState extends State<FolderDetailsPage> {
  Database db = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back,
                color: AppColor.primaryBlue,
              ),
              AppGap.size6,
              Flexible(
                child: Text(
                  '홈',
                  style: AppTextStyle.bodyLarge(AppColor.primaryBlue),
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              bottomSheet(
                context: context,
                child: DialogBox(
                    folderName: widget.folderName,
                    folderColor: widget.folderColor),
                height: MediaQuery.of(context).size.height * 0.35,
              );
            },
            icon: const Icon(
              Icons.more_vert_rounded,
              color: AppColor.primaryBlue,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size(36, 36),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.folderName,
                  style: AppTextStyle.headlineLarge(Color(widget.folderColor)),
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Consumer<Database>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          itemCount: db.folderList.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            return TodoListTile(
                              todoTitle: '안녕',
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              //! 하단바
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // 투두앱 생성 메서드
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_box_rounded,
                            color: Color(widget.folderColor),
                          ),
                          AppGap.size8,
                          Text(
                            '새로운 할 일',
                            style: AppTextStyle.titleLarge(
                              Color(widget.folderColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/config/app_gap.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';
import 'package:flutter_todo_app/app/utils/bottom_sheet.dart';
import 'package:flutter_todo_app/app/utils/database.dart';
import 'package:flutter_todo_app/presentation/pages/add_todo_page.dart';
import 'package:flutter_todo_app/presentation/widgets/dialog_box_widget.dart';
import 'package:flutter_todo_app/presentation/widgets/list_tile/todo_list_tile_widget.dart';
import 'package:provider/provider.dart';

class FolderDetailsPage extends StatefulWidget {
  final int folderIndex;
  final String folderName;
  final int folderColor;

  const FolderDetailsPage({
    super.key,
    required this.folderIndex,
    required this.folderName,
    required this.folderColor,
  });

  @override
  State<FolderDetailsPage> createState() => _FolderDetailsPageState();
}

class _FolderDetailsPageState extends State<FolderDetailsPage> {
  Database db = Database();

  void checkBoxChanged(bool? value, int index) {
    var ongoingTodo = db.folderList[widget.folderIndex][2];

    setState(() {
      ongoingTodo[index][1] = !ongoingTodo[index][1];
    });
    moveToCompleted(value, index);
    db.updateDataBase();
  }

  void moveToCompleted(bool? value, int index) {
    if (value == true) {
      var ongoingTodo = db.folderList[widget.folderIndex][2][index];
      db.folderList[widget.folderIndex][2].removeAt(index);
      db.folderList[widget.folderIndex][3].add(ongoingTodo);
      db.updateDataBase();
    }
  }

  void removeTodoFromList(int index) {
    db.removeTodoFromFolder(widget.folderIndex, index); // 수정된 메서드 호출
  }

  @override
  Widget build(BuildContext context) {
    print('===== FolderDetailsPage =====');
    print('folderIndex : ${widget.folderIndex}');
    print('folderName : ${widget.folderName}');
    print('folderColor : ${widget.folderColor}');
    print('ongoingTodo : ${db.folderList[widget.folderIndex][2]}');

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
                    folderIndex: widget.folderIndex,
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
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Stack(
            children: [
              Consumer<Database>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: db.folderList[widget.folderIndex][2].length,
                    itemBuilder: (BuildContext context, int index) {
                      var ongoingTodo = db.folderList[widget.folderIndex][2];
                      return TodoListTile(
                        todoTitle: ongoingTodo[index][0],
                        taskCompleted: ongoingTodo[index][1],
                        onChanged: (value) => checkBoxChanged(value, index),
                        deleteFunction: (context) => removeTodoFromList(index),
                      );
                    },
                  );
                },
              ),

              //! 하단바
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        bottomSheet(
                          context: context,
                          child: AddTodoPage(
                            folderIndex: widget.folderIndex,
                          ),
                          height: MediaQuery.of(context).size.height * 0.92,
                        );
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

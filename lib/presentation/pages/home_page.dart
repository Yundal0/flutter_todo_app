// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_text_style.dart';
import 'package:flutter_todo_app/app/utils/database.dart';
import 'package:flutter_todo_app/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter_todo_app/presentation/widgets/list_tile/folder_list_tile_widget.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Database db = Database();

  @override
  void initState() {
    super.initState();
    final myBox = Hive.box('mybox');

    // db.deleteAllFolders();
    // db.updateDataBase();

    if (myBox.get("FOLDERLIST") == null) {
      db.createInitialData();
      print('createInitialData');
    } else {
      db.loadData();
      print('loadData');
      print(db.folderList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          '나의 폴더',
          style: AppTextStyle.headlineMedium(),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.all(12),
        //     child: GestureDetector(
        //       onTap: () {
        //         setState(() {
        //           isEditMode = !isEditMode; // 편집 모드 토글
        //         });
        //       },
        //       child: Text(
        //         '편집',
        //         style: AppTextStyle.bodyLarge(AppColor.primaryBlue),
        //       ),
        //     ),
        //   )
        // ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(
            children: [
              //! ListView
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Consumer<Database>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          itemCount: db.folderList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var folderList = db.folderList[index];
                            return FolderListTile(
                                folderColor: folderList[0],
                                folderName: folderList[1],
                                todos: folderList[2].length.toString());
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              //! 하단바
              BottomNavBar()
            ],
          ),
        ),
      ),
    );
  }
}

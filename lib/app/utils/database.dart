import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';

class Database extends ChangeNotifier {
  //! 인스턴스 생성
  static final Database _instance = Database._internal();
  final Box _myBox = Hive.box('mybox');

  //! 리스트 생성
  List<dynamic> folderList = [];

  Database._internal();

  factory Database() {
    return _instance;
  }

  void createInitialData() {
    folderList = [
      [AppColor.primaryBlueHex, "할 일"],
    ];
    updateDataBase();
  }

  void loadData() {
    folderList = _myBox.get("FOLDERLIST") ?? [];
    notifyListeners();
  }

  void addFolder(int color, String name) {
    folderList.add([color, name]);
    updateDataBase();
  }

  void updateDataBase() {
    _myBox.put("FOLDERLIST", folderList);
    notifyListeners();
  }

    void removeFolder(String name) {
    folderList.removeWhere((item) => item[1] == name);
    updateDataBase();  // DB 업데이트 및 변경 사항 알림
  }
}

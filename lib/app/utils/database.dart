import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';

class Database extends ChangeNotifier {
  //! 인스턴스 생성
  static final Database _instance = Database._internal();
  final Box _myBox = Hive.box('mybox');

  //! 초기 설정
  List<dynamic> folderList = [];
  List<dynamic> ongoingTodos = [];
  List<dynamic> completedTodos = [];

  Database._internal();

  factory Database() {
    return _instance;
  }

  void createInitialData() {
    folderList = [
      {
        "folderName": "할 일",
        "folderColor": AppColor.primaryBlueHex,
        "ongingTodos": [],
        "completedTodos": []
      },
    ];
    updateDataBase();
  }

  //! CREATE
  void createFolder(String folderName, int folderColor,
      List<dynamic> ongoingTodos, List<dynamic> completedTodos) {
    folderList.add([folderName, folderColor, ongoingTodos, completedTodos]);
    updateDataBase();
  }

  void createTodo(int folderIndex, String todoTitle) {
    folderList[folderIndex][2].add([todoTitle, false]);
    updateDataBase();
  }

  //! READ
  void loadData() {
    folderList = _myBox.get("FOLDERLIST") ?? [];
    notifyListeners();
  }

  //! UPDATE
  void updateDataBase() {
    _myBox.put("FOLDERLIST", folderList);
    notifyListeners();
  }

  //! DELETE
  void removeFolder(String name) {
    folderList.removeWhere((item) => item[0] == name);
    updateDataBase();
  }

  void removeTodo(int index) {
    folderList.removeAt(index);
    updateDataBase();
  }

  void deleteAllFolders() {
    folderList.clear(); 
    updateDataBase(); 
  }

  //! 기타 기능
  void removeTodoFromFolder(int folderIndex, int todoIndex) {
    folderList[folderIndex][2].removeAt(todoIndex);
    updateDataBase();
    notifyListeners();
  }

  void checkBoxChanged(bool? value, int index) {
    folderList[index][3] = folderList[index][4];
    updateDataBase();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/config/app_color.dart';
import 'package:flutter_todo_app/app/utils/database.dart';
import 'package:flutter_todo_app/presentation/widgets/list_tile/todo_list_tile_widget.dart';
import 'package:provider/provider.dart';

class CompletedTodoPage extends StatefulWidget {
  final int folderIndex;
  final String folderName;
  final int folderColor;

  const CompletedTodoPage({
    super.key,
    required this.folderIndex,
    required this.folderName,
    required this.folderColor,
  });

  @override
  State<CompletedTodoPage> createState() => _CompletedTodoPageState();
}

class _CompletedTodoPageState extends State<CompletedTodoPage> {
  Database db = Database();

  void checkBoxChanged(bool? value, int index) {
    var completedTodo = db.folderList[widget.folderIndex][3];
    setState(() {
      completedTodo[index][1] = !completedTodo[index][1];
    });
    moveToOngoing(value, index);
    db.updateDataBase();
  }

  void moveToOngoing(bool? value, int index) {
    if (value == false) {
      var completedTodo = db.folderList[widget.folderIndex][3][index];
      db.folderList[widget.folderIndex][3].removeAt(index);
      db.folderList[widget.folderIndex][2].add(completedTodo);
      db.updateDataBase();
    }
  }

    void removeTodoFromList(int index) {
    db.removeTodoFromFolder(widget.folderIndex, index); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: AppColor.neutral00,
        ),
        title: Text(
          '${widget.folderName}의 완료된 항목',
          style: TextStyle(
            color: Color(widget.folderColor),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Consumer<Database>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: db.folderList[widget.folderIndex][3].length,
                itemBuilder: (BuildContext context, int index) {
                  var ongoingTodo = db.folderList[widget.folderIndex][3];
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
        ),
      ),
    );
  }
}

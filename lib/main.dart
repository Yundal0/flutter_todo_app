import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/utils/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_todo_app/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // 추가: Flutter 엔진과 위젯 트리가 바인딩되도록 합니다.
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => Database(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter TODO App',
      home: HomePage(),
    );
  }
}

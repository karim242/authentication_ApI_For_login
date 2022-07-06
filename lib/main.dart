import 'package:flutter/material.dart';
// import 'package:login_page/register_screen.dart';
import 'package:login_page/todo.dart';

import 'login_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowMaterialGrid: false,
       home:TodoApp(),

    );
  }
}


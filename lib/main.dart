//main.dart


import 'package:flutter/material.dart';
import 'package:halla_food/main_page.dart';

//앱 시작 부분
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(), //표시할 화면의 인스턴스
    );
  }
}

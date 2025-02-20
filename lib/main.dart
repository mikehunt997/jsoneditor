import 'package:demo/dest4/memory_screen.dart';
import 'package:demo/pages/json_editor_page.dart';

import 'test3.dart';
import 'test3/memory_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'test.dart';
import 'test1/character_creation_screen.dart';
import 'test2.dart';
import 'test2/character_creation_layout.dart';
import 'test5/chat_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SF Pro Display',
          scaffoldBackgroundColor: Colors.white,
        ),
        home: JsonEditorPage(),
      ),
    );
  }
}

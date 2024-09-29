import 'package:chungumbas/meny_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MenyPage(),
        );
      },
    );
  }
}

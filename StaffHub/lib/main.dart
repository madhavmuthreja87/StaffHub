import 'package:flutter/material.dart';
import 'package:staffhub/core/app_theme.dart';
import 'package:staffhub/screens/admin_panels/admin_home_screen.dart';
import 'package:staffhub/screens/admin_panels/staff_List.dart';

import 'package:staffhub/screens/admin_panels/staff_detail.dart';
import 'package:staffhub/screens/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const AdminHomeScreen(),
    );
  }
}

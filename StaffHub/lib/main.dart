import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:staffhub/core/app_theme.dart';
import 'package:staffhub/providers/leave_provider.dart';
import 'package:staffhub/providers/salary_advance_provider.dart';
import 'package:staffhub/providers/salary_provider.dart';
import 'package:staffhub/providers/staff_provider.dart';
import 'package:staffhub/screens/admin_panels/add_staff.dart';
import 'package:staffhub/screens/admin_panels/admin_home_screen.dart';
import 'package:staffhub/screens/admin_panels/staff_List.dart';

import 'package:staffhub/screens/admin_panels/staff_detail.dart';
import 'package:staffhub/screens/sign_up.dart';
import 'package:staffhub/screens/staff_panel/staff_home_screen.dart';
import 'package:staffhub/services/hive_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveServices().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StaffProvider()),
        ChangeNotifierProvider(create: (context) => LeaveProvider()),
        ChangeNotifierProvider(create: (context) => SalaryProvider()),
        ChangeNotifierProvider(create: (context) => SalaryAdvanceProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const AdminNavBar(),
    );
  }
}

class AdminNavBar extends StatefulWidget {
  const AdminNavBar({super.key});

  @override
  State<AdminNavBar> createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {
  List<Widget> adminscreens = [AdminHomeScreen(), StaffList(), AddStaff()];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: adminscreens[currentindex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        elevation: 20,

        onTap: (value) {
          currentindex = value;
          setState(() {});
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: " Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Staff list",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add staff"),
        ],
      ),
    );
  }
}

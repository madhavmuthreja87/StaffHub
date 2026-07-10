import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({super.key});

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            text: 'Staff ',
            style: theme.titleMedium,
            children: [
              TextSpan(
                text: "Hub",
                style: theme.titleMedium?.copyWith(color: AppColor.greyish),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24,
          top: 0,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shop Name", style: theme.titleLarge),
                Text(
                  "[Staff]",
                  style: theme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Hi, Staff Name",
              style: theme.displaySmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(),
              width: MediaQuery.sizeOf(context).width,
              child: Card(
                color: const Color.fromARGB(202, 252, 161, 23),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today's Attendance", style: theme.headlineSmall),
                      Text(
                        "Present",
                        style: theme.displayLarge?.copyWith(fontSize: 36),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  width: MediaQuery.sizeOf(context).width / 2.31,
                  child: Card(
                    color: const Color.fromARGB(202, 252, 161, 23),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Advance Taken", style: theme.headlineSmall),
                          Text(
                            "₹3400",
                            style: theme.displayLarge?.copyWith(fontSize: 42),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  width: MediaQuery.sizeOf(context).width / 2.31,
                  child: Card(
                    color: const Color.fromARGB(202, 252, 161, 23),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Leave", style: theme.headlineSmall),
                          Text(
                            "2",
                            style: theme.displayLarge?.copyWith(fontSize: 42),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(),
              width: MediaQuery.sizeOf(context).width,
              child: Card(
                color: const Color.fromARGB(202, 252, 161, 23),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Monthly Salary", style: theme.headlineSmall),
                      Text(
                        "₹12000",
                        style: theme.displayLarge?.copyWith(fontSize: 44),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              width: MediaQuery.sizeOf(context).width,
              child: Card(
                color: const Color.fromARGB(202, 252, 161, 23),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Remaining amount", style: theme.headlineSmall),
                      Text(
                        "₹9600",
                        style: theme.displayLarge?.copyWith(fontSize: 44),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

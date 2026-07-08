import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
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
          top: 12,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shop Name", style: theme.titleLarge),
            const SizedBox(height: 8),
            Text("Hi, Owner Name", style: theme.displaySmall),
            const SizedBox(height: 40),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(70, 255, 153, 0),
                  ),
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: Column(
                    children: [
                      const Text("Staff"),
                      Text("8", style: theme.displayLarge),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

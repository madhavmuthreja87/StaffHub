import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';

class StaffList extends StatefulWidget {
  const StaffList({super.key});

  @override
  State<StaffList> createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
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
        padding: const EdgeInsets.only(left: 14.0, right: 14, top: 8),
        child: ListView(
          children: [
            Text("Staff list", style: theme.displaySmall),
            SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text("Name", style: theme.headlineMedium),
                subtitle: Text("Role"),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text("Name", style: theme.headlineMedium),
                subtitle: Text("Role"),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text("Name", style: theme.headlineMedium),
                subtitle: Text("Role"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

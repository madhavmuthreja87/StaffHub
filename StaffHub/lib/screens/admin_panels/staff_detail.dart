import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';

class StaffDetail extends StatefulWidget {
  const StaffDetail({super.key});

  @override
  State<StaffDetail> createState() => _StaffDetailState();
}

class _StaffDetailState extends State<StaffDetail> {
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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 45, child: Icon(Icons.person)),
                    const SizedBox(height: 30),
                    Text("Staff's name", style: theme.displaySmall),
                    Text('Staff Role', style: theme.titleMedium),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text("Holidays List", style: theme.headlineMedium),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.greyish,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: MediaQuery.sizeOf(context).height / 3,
                padding: EdgeInsets.all(8),

                child: ListView(
                  children: [
                    Card(
                      child: ListTile(
                        leading: Text("Date", style: TextStyle(fontSize: 18)),
                        title: Text("Reason.............."),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Text("Date", style: TextStyle(fontSize: 18)),
                        title: Text("Reason.............."),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Text("Date", style: TextStyle(fontSize: 18)),
                        title: Text("Reason.............."),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Text("Date", style: TextStyle(fontSize: 18)),
                        title: Text("Reason.............."),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Text("Date", style: TextStyle(fontSize: 18)),
                        title: Text("Reason.............."),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Text("Date", style: TextStyle(fontSize: 18)),
                        title: Text("Reason.............."),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Text("Date", style: TextStyle(fontSize: 18)),
                        title: Text("Reason.............."),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 3,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: AppColor.textDark,
                        backgroundColor: AppColor.orange,
                        elevation: 20,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Mark Halfday",
                        style: theme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 3,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: AppColor.textDark,
                        backgroundColor: const Color.fromARGB(209, 255, 0, 0),
                        elevation: 20,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Mark Absent",
                        style: theme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

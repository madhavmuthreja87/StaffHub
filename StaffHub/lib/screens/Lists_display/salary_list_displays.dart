import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';
import 'package:staffhub/models/salary_model.dart';

class SalaryListDisplays extends StatefulWidget {
  final List<SalaryModel> items;
  const SalaryListDisplays({super.key, required this.items});

  @override
  State<SalaryListDisplays> createState() => _SalaryListDisplaysState();
}

class _SalaryListDisplaysState extends State<SalaryListDisplays> {
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
          left: 20.0,
          right: 20,
          top: 0,
          bottom: 50,
        ),
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: const Color.fromARGB(180, 176, 175, 175),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Scrollbar(
            radius: Radius.circular(20),
            thumbVisibility: true,
            thickness: 10,
            child: widget.items.length != 0
                ? ListView.builder(
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(
                            widget.items[index].salary.toString(),
                            style: theme.titleLarge?.copyWith(fontSize: 20),
                          ),
                          title: Text(
                            widget.items[index].staffid,
                            style: theme.bodyLarge,
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'No absent in record',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

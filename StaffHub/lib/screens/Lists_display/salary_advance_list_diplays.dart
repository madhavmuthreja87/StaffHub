import 'package:flutter/material.dart';
import 'package:staffhub/core/app_color.dart';
import 'package:staffhub/models/salaryadvance_model.dart';

class SalaryAdvanceListDiplays extends StatefulWidget {
  final List<SalaryadvanceModel> items;
  const SalaryAdvanceListDiplays({super.key, required this.items});

  @override
  State<SalaryAdvanceListDiplays> createState() =>
      _SalaryAdvanceListDeiplaysState();
}

class _SalaryAdvanceListDeiplaysState extends State<SalaryAdvanceListDiplays> {
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
                            widget.items[index].date.toString().substring(
                              0,
                              10,
                            ),
                            style: theme.titleLarge?.copyWith(fontSize: 20),
                          ),
                          trailing: Text(
                            widget.items[index].amount.toString(),
                            style: theme.bodyLarge?.copyWith(fontSize: 24),
                          ),
                          title: Text(widget.items[index].reason),
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

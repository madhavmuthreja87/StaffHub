import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staffhub/core/app_color.dart';
import 'package:staffhub/models/leave_model.dart';
import 'package:staffhub/models/salary_model.dart';
import 'package:staffhub/models/salaryadvance_model.dart';
import 'package:staffhub/models/staff_model.dart';
import 'package:staffhub/providers/leave_provider.dart';
import 'package:staffhub/providers/salary_advance_provider.dart';
import 'package:staffhub/providers/salary_provider.dart';
import 'package:staffhub/providers/staff_provider.dart';
import 'package:staffhub/screens/Lists_display/leave_list_display.dart';
import 'package:staffhub/screens/Lists_display/salary_advance_list_diplays.dart';
import 'package:staffhub/screens/Lists_display/salary_list_displays.dart';
import 'package:staffhub/widgets/custom_text_field.dart';

class StaffDetail extends StatefulWidget {
  final String name;
  final String id;

  const StaffDetail({super.key, required this.name, required this.id});

  @override
  State<StaffDetail> createState() => _StaffDetailState();
}

class _StaffDetailState extends State<StaffDetail> {
  TextEditingController reasonController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final staff = context.watch<StaffProvider>().l;
    final leave = context.watch<LeaveProvider>().l;
    final salary = context.watch<SalaryProvider>().l;
    final salaryadvance = context.watch<SalaryAdvanceProvider>().l;
    StaffModel s = staff.firstWhere((staff) => staff.name == widget.name);

    List<LeaveModel> lv = leave
        .where((leave) => leave.staffid == widget.id)
        .toList();

    List<SalaryadvanceModel> sadv = salaryadvance
        .where((element) => element.staffid == widget.id)
        .toList();
    List<SalaryModel> sal = salary
        .where((staff) => staff.staffid == widget.id)
        .toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24,
            top: 12,
            bottom: 12,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(lv.length);
                        },
                        child: CircleAvatar(
                          radius: 42,
                          child: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text("${s.name}", style: theme.displaySmall),
                      Text(
                        'Staff Role',
                        style: theme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color.fromARGB(255, 169, 167, 167),
                        ),
                      ),
                    ],
                  ),
                ),

                Text("Details List", style: theme.headlineMedium),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.greyish,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.sizeOf(context).height / 3.05,
                  padding: EdgeInsets.all(3),

                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          final absent = lv
                              .where((element) => element.isFullDay == true)
                              .toList();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LeaveListDisplay(items: absent),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Absent list",
                              style: theme.headlineMedium?.copyWith(
                                fontSize: 23,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: const Color.fromARGB(255, 137, 134, 134),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          final halfday = lv
                              .where((element) => element.isFullDay == false)
                              .toList();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LeaveListDisplay(items: halfday),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Halfday list",
                              style: theme.headlineMedium?.copyWith(
                                fontSize: 23,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: const Color.fromARGB(255, 137, 134, 134),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SalaryAdvanceListDiplays(items: sadv),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Advance salary list",
                              style: theme.headlineMedium?.copyWith(
                                fontSize: 23,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: const Color.fromARGB(255, 137, 134, 134),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SalaryListDisplays(items: sal),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Salary history list",
                              style: theme.headlineMedium?.copyWith(
                                fontSize: 23,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: const Color.fromARGB(255, 137, 134, 134),
                            ),
                          ),
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
                          backgroundColor: const Color.fromARGB(
                            196,
                            64,
                            195,
                            255,
                          ),
                          elevation: 8,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Pay salary"),
                                actions: [
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      title: 'salary amount',
                                      controller: salaryController,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),

                                  SizedBox(height: 22),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      title: 'Date',
                                      controller: dateController,
                                      keyboardType: TextInputType.datetime,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          int sid = Random().nextInt(10000);
                                          SalaryModel salary = SalaryModel(
                                            salaryid: sid.toString(),
                                            staffid: widget.id,
                                            salary:
                                                double.tryParse(
                                                  salaryController.text,
                                                ) ??
                                                0.0,
                                            deduction: 0,
                                            ispaid: true,
                                          );
                                          context
                                              .read<SalaryProvider>()
                                              .addSalary(salary);
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                    196,
                                                    64,
                                                    195,
                                                    255,
                                                  ),
                                              content: Text("Salary paid"),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Done",
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              196,
                                              11,
                                              119,
                                              169,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Pay salary",
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
                          backgroundColor: const Color.fromARGB(
                            231,
                            126,
                            202,
                            129,
                          ),
                          elevation: 8,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Advance salary"),
                                actions: [
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      title: 'Reason',
                                      controller: reasonController,
                                    ),
                                  ),

                                  SizedBox(height: 22),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      title: 'Amount',
                                      controller: amountController,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),

                                  SizedBox(height: 22),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      title: 'Date',
                                      controller: dateController,
                                      keyboardType: TextInputType.datetime,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          int adsid = Random().nextInt(10000);
                                          SalaryadvanceModel salaryadvance =
                                              SalaryadvanceModel(
                                                advancesalaryid: adsid
                                                    .toString(),
                                                staffid: widget.id,
                                                amount:
                                                    double.tryParse(
                                                      amountController.text,
                                                    ) ??
                                                    0.0,
                                                date: DateTime.now(),
                                                reason: reasonController.text,
                                              );
                                          context
                                              .read<SalaryAdvanceProvider>()
                                              .addSalaryAdvance(salaryadvance);
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                    231,
                                                    126,
                                                    202,
                                                    129,
                                                  ),
                                              content: Text(
                                                "Advance salary paid",
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Done",
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              44,
                                              192,
                                              49,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Advance salary",
                          style: theme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
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
                          elevation: 8,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Marking Halfday"),
                                actions: [
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      title: 'Reason',
                                      controller: reasonController,
                                    ),
                                  ),
                                  SizedBox(height: 22),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      title: 'Date of leave',
                                      controller: dateController,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          LeaveModel leave = LeaveModel(
                                            leaveid: '',
                                            staffid: widget.id,
                                            reason: reasonController.text,
                                            isFullDay: false,
                                            leavedate: DateTime.now(),
                                          );

                                          context
                                              .read<LeaveProvider>()
                                              .addLeave(leave);
                                          Navigator.pop(context);
                                          reasonController.text = '';
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                    219,
                                                    255,
                                                    153,
                                                    0,
                                                  ),
                                              content: Text("Halfday marked"),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Halfday",
                                          style: TextStyle(
                                            color: AppColor.orange,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
                          backgroundColor: Colors.redAccent,
                          elevation: 8,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Marking Absent"),
                                actions: [
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      title: 'Reason',
                                      controller: reasonController,
                                    ),
                                  ),
                                  SizedBox(height: 22),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      title: 'Date of leave',
                                      controller: dateController,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          LeaveModel leave = LeaveModel(
                                            leaveid: '',
                                            staffid: widget.id,
                                            reason: reasonController.text,
                                            isFullDay: true,
                                            leavedate: DateTime.now(),
                                          );

                                          context
                                              .read<LeaveProvider>()
                                              .addLeave(leave);
                                          Navigator.pop(context);
                                          reasonController.text = '';
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.redAccent,
                                              content: Text("Absent marked"),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Absent",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
      ),
    );
  }
}

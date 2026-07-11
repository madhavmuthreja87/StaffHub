import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staffhub/core/app_color.dart';
import 'package:staffhub/models/leave_model.dart';
import 'package:staffhub/models/staff_model.dart';
import 'package:staffhub/providers/leave_provider.dart';
import 'package:staffhub/providers/staff_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final staff = context.watch<StaffProvider>().l;
    final leave = context.watch<LeaveProvider>().l;

    StaffModel s = staff.firstWhere((staff) => staff.name == widget.name);
    List<LeaveModel> lv = leave
        .where((leave) => leave.staffid == widget.id)
        .toList();

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          radius: 45,
                          child: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text("${s.name}", style: theme.displaySmall),
                      Text(
                        'Staff Role',
                        style: theme.titleMedium?.copyWith(
                          color: const Color.fromARGB(255, 169, 167, 167),
                        ),
                      ),
                    ],
                  ),
                ),

                Text("Holidays List", style: theme.headlineMedium),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.greyish,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.sizeOf(context).height / 3,
                  padding: EdgeInsets.all(8),

                  child: lv.length != 0
                      ? ListView.builder(
                          itemCount: lv.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: Text(
                                  lv[index].leavedate.toString().substring(
                                    0,
                                    10,
                                  ),
                                  style: TextStyle(fontSize: 18),
                                ),
                                title: Text(lv[index].reason),
                              ),
                            );
                          },
                        )
                      //   // child:
                      //   // ListTile(
                      //   //   leading: Text(lv.leavedate.toString()),
                      //   //   title: Text(lv.reason),
                      //   // ),
                      : Center(
                          child: Text(
                            "No leave in record",
                            style: theme.headlineMedium,
                          ),
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
                                      TextButton(
                                        onPressed: () {
                                          LeaveModel leave = LeaveModel(
                                            leaveid: '',
                                            staffid: widget.id,
                                            reason: reasonController.text,
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

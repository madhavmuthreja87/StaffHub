import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:staffhub/models/leave_model.dart';

class LeaveProvider extends ChangeNotifier {
  final Box<LeaveModel> box = Hive.box("leaveBox");
  List<LeaveModel> get l => box.values.toList();

  void addLeave(LeaveModel leave) {
    box.put(leave.leaveid, leave);
    notifyListeners();
  }
}

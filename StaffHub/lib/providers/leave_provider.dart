import 'package:flutter/material.dart';
import 'package:staffhub/models/leave_model.dart';

class LeaveProvider extends ChangeNotifier {
  List<LeaveModel> leave = [];
  List<LeaveModel> get l => leave;

  void addLeave(LeaveModel leave) {
    l.add(leave);
    notifyListeners();
  }
}

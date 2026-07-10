import 'package:flutter/material.dart';
import 'package:staffhub/models/staff_model.dart';

class StaffProvider extends ChangeNotifier {
  List<StaffModel> _staff = [];
  List<StaffModel> get l => _staff;

  void AddStaff(StaffModel staff) {
    l.add(staff);
    notifyListeners();
  }
}

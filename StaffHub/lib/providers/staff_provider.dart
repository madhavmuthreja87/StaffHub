import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:staffhub/models/staff_model.dart';

class StaffProvider extends ChangeNotifier {
  final Box<StaffModel> box = Hive.box<StaffModel>("staffBox");
  List<StaffModel> get l => box.values.toList();

  void AddStaff(StaffModel staff) {
    box.put(staff.staffid, staff);
    notifyListeners();
  }
}

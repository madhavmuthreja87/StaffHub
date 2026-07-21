import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:staffhub/models/salary_model.dart';

class SalaryProvider extends ChangeNotifier {
  final Box<SalaryModel> box = Hive.box<SalaryModel>("salaryBox");
  List<SalaryModel> get l => box.values.toList();

  void addSalaryToLocal(SalaryModel salary) {
    box.put(salary.salaryid, salary);
    notifyListeners();
  }
}

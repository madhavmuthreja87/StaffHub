import 'package:flutter/material.dart';
import 'package:staffhub/models/salary_model.dart';

class SalaryProvider extends ChangeNotifier {
  List<SalaryModel> salary = [];
  List<SalaryModel> get l => salary;

  void addSalary(SalaryModel salary) {
    l.add(salary);
    notifyListeners();
  }
}

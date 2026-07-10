import 'package:flutter/material.dart';
import 'package:staffhub/models/salaryadvance_model.dart';

class SalaryAdvanceProvider extends ChangeNotifier {
  List<SalaryadvanceModel> salaryadvance = [];
  List<SalaryadvanceModel> get l => salaryadvance;

  void addSalaryAdvance(SalaryadvanceModel salaryadvance) {
    l.add(salaryadvance);
    notifyListeners();
  }
}

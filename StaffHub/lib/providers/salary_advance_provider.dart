import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:staffhub/models/salaryadvance_model.dart';

class SalaryAdvanceProvider extends ChangeNotifier {
  final Box<SalaryadvanceModel> box = Hive.box<SalaryadvanceModel>(
    "salaryAdvanceBox",
  );
  List<SalaryadvanceModel> get l => box.values.toList();
  void addSalaryAdvance(SalaryadvanceModel salaryadvance) {
    box.put(salaryadvance.advancesalaryid, salaryadvance);
    notifyListeners();
  }
}

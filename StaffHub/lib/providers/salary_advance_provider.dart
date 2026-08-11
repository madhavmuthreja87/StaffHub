import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:staffhub/models/salaryadvance_model.dart';

class SalaryAdvanceProvider extends ChangeNotifier {
  final Box<SalaryadvanceModel> box = Hive.box<SalaryadvanceModel>(
    "salaryAdvanceBox",
  );
  List<SalaryadvanceModel> get l => box.values.toList();

  void addSalaryAdvanceToLocal(SalaryadvanceModel salaryadvance) {
    box.put(salaryadvance.advancesalaryid, salaryadvance);
    print("Advance salary data saved to local Data base");
    notifyListeners();
  }

  void addSalaryAdvanceToFireBase(SalaryadvanceModel salaryadvance) {
    try {
      FirebaseFirestore.instance
          .collection('Users')
          .doc('Staff')
          .collection('salary_advance')
          .doc(salaryadvance.staffid)
          .set({
            "advancesalaryid": salaryadvance.advancesalaryid,
            "staffid": salaryadvance.staffid,
            "amount": salaryadvance.amount,
            "date": salaryadvance.date,
            "reason": salaryadvance.reason,
          });

      print("Advance salary data saved to firestore");
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }
}

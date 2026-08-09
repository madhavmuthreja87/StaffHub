import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:staffhub/models/staff_model.dart';

class StaffProvider extends ChangeNotifier {
  final Box<StaffModel> box = Hive.box<StaffModel>("staffBox");
  List<StaffModel> get l => box.values.toList();

  void AddStaffToLocal(StaffModel staff) {
    box.put(staff.staffid, staff);
    print("Staff data saved to local Data base");
    notifyListeners();
  }

  void AddStaffToFireBase(StaffModel staff) {
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc("Staff")
          .collection("uid")
          .doc(staff.staffid)
          .set({
            "staffid": staff.staffid,
            "ownerid": staff.ownerid,
            "name": staff.name,
            "email": staff.email,
            "address": staff.address,
            "role": staff.role,
            "salary": staff.salary,
            "profileImage": staff.profileImage,
            "joiningDate": staff.joiningDate,
            "todayPresent": staff.todayPresent,
          });

      print('Staff data saved to firestore');
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }
}

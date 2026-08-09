import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:staffhub/models/leave_model.dart';

class LeaveProvider extends ChangeNotifier {
  final Box<LeaveModel> box = Hive.box("leaveBox");
  List<LeaveModel> get l => box.values.toList();

  void addLeaveToLocal(LeaveModel leave) {
    box.put(leave.leaveid, leave);
    print("Leave added to local Database");
    notifyListeners();
  }

  void AddLeaveToFireBase(LeaveModel leave) {
    try {
      FirebaseFirestore.instance
          .collection('Users')
          .doc('Staff')
          .collection('leaves')
          .doc(leave.leaveid)
          .set({
            "leaveid": leave.leaveid,
            "staffid": leave.staffid,
            "reason": leave.reason,
            "isFullDay": leave.isFullDay,
            "leavedate": leave.leavedate,
          });
      print("Leave data saved to firestore");
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }
}

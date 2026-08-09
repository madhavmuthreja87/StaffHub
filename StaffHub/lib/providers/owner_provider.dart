import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:staffhub/models/owner_model.dart';

class OwnerProvider extends ChangeNotifier {
  final Box<OwnerModel> box = Hive.box<OwnerModel>("ownerBox");
  List<OwnerModel> get l => box.values.toList();

  void AddOwnerToLocal(OwnerModel owner) {
    box.put(owner.ownerid, owner);
    print("Owner data saved to local Data base");
    notifyListeners();
  }

  void AddOwnerToFireBase(OwnerModel owner) {
    try {
      FirebaseFirestore.instance
          .collection('Users')
          .doc('Owner')
          .collection("uid")
          .doc(owner.ownerid)
          .set({
            "ownerID": owner.ownerid,
            "name": owner.name,
            "email": owner.email,
            "shopname": owner.shopname,
            "shopaddress": owner.shopaddress,
            "businesstype": owner.businesstype,
            "profileimage": owner.profileImage,
            "Stafflist": owner.stafflist,
          });
      print('Owner data saved to firestore');
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }
}
